import json
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse

# --- GAME LOGIC ENGINE ---
class GameEngine:
    def __init__(self):
        self.state = "EXPLORATION" 
        self.distance = 0
        self.timer = 5.0
        self.heart_time = 0.0
        self.logs = ["System Online.", "Ready for input."]
        self.heroes = [
            {"name": "Elara", "role": "Mage", "hp": 110, "mana": 500, "speed": 2.4, "special": "Star-Fall"},
            {"name": "Korgath", "role": "Tank", "hp": 350, "mana": 500, "speed": 3.4, "special": "Iron Bastion"},
            {"name": "Silas", "role": "Defender", "hp": 220, "mana": 500, "speed": 3.0, "special": "Guard's Vow"},
            {"name": "Kaelen", "role": "Mage", "hp": 130, "mana": 500, "speed": 2.4, "special": "Void Pulse"},
            {"name": "Ignus", "role": "AOE_DD", "hp": 190, "mana": 500, "speed": 3.0, "special": "Flame_Veil"}
        ]

    def process(self):
        old_dist = self.distance
        self.distance += 10
        if self.state == "EXPLORATION":
            if self.distance % 50 == 0:
                self.state = "TRANSITION"
                self.timer = 5.0
                self.log_action(f"!!! ENCOUNTER DETECTED! (Moved {old_dist} -> {self.distance})")
        elif self.state == "TRANSITION":
            self.timer -= 1.0
            if self.timer <= 0:
                self.state = "COMBAT"
                self.log_action("Entered Combat State.")
        elif self.state == "COMBAT":
            self.heart_time += 1.5
            for h in self.heroes:
                if (self.heart_time % h['speed']) < 2.0:
                    if h['mana'] >= 1000:
                        self.log_action(f"!!! {h['name']} cast SPECIAL_MOVE! ({h['special']})")
                        h['mana'] = 500
                    else:
                        h['mana'] += 25
        self.log_action(f"Step logged (Dist: {self.distance})")

    def log_action(self, msg):
        self.logs.append(f"[{self.state}] {msg}")

engine = GameEngine()

# --- WEB SERVER IMPLEMENTATION ---
class DashboardHandler(BaseHTTPRequestHandler):
    def _handle_preflight(self):
        """Handle CORS preflight (OPTIONS) requests."""
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_GET(self):
        # Standardize the path immediately
        path = urlparse(self.path).path
        if path == "" or path == "/":
            path = "/"
        elif path.endswith("/"):
            path = path[:-1]
        
        print(f"[*] Incoming: {self.path} -> Interpreted as: {path}")

        # Set CORS for all GET requests
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")

        if path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            content = """
            <html>
            <head>
                <title>Game Logic Dashboard</title>
                <style>
                    body { background: #1a1a1a; color: #00ffcc; font-family: 'Courier New', monospace; padding: 20px; }
                    .card { border: 2px solid #00ffcc; padding: 20px; margin: 15px; border-radius: 10px; background: #262626; box-shadow: 0 4px 10px rgba(0,255,200,0.3); }
                    h1 { text-align: center; color: white; margin-bottom: 30px; }
                    #log { height: 350px; overflow-y: auto; background: #000; padding: 15px; border: 1px solid #444; font-size: 0.9em; white-space: pre-wrap; }
                    .status { color: gold; font-size: 1.5em; }
                    button { background: #00ffcc; border: none; padding: 12px 24px; cursor: pointer; font-weight: bold; border-radius: 5px; transition: 0.2s; }
                    button:active { transform: scale(0.95); }
                    #status_msg { color: #ffaa00; margin-top: 10px; font-size: 0.8em; min-height: 1.2em; }
                </style>
            </head>
            <body onload="fetchData()">
                <h1>GAME_CORE_LOGIC_VIEWER</h1>
                <div class="card">
                    <h2>State Engine</h2>
                    <p>Status: <span id="state" class="status">...</span></p>
                    <p>Distance: <span id="dist">0</span>m</p>
                    <p>Timer: <span id="timer">5</span>s | Heartbeat: <span id="heart_time">0</span></p>
                    <button onclick="handleStep()">ADVANCE LOGIC STEP</button>
                    <div id="status_msg">System Ready.</div>
                </div>
                <div class="card">
                    <h2>Hero Squad</h2>
                    <div id="hero_list">Loading...</div>
                </div>
                <h3>Log Feed</h3>
                <div id="log" class="card"></div>

                <script>
                    const statusMsg = document.getElementById('status_msg');

                    async function fetchData() {
                        try {
                            const res = await fetch('/data');
                            if (!res.ok) throw new Error("HTTP " + res.status);
                            const data = await res.json();
                            document.getElementById('state').innerText = data.state;
                            document.getElementById('dist').innerText = data.distance;
                            document.getElementById('timer').innerText = Math.max(0, data.timer);
                            document.getElementById('heart_time').innerText = data.heart_time;
                            
                            const listStr = data.heroes.map(h => `<div>[${h.name}] ${h.role} | HP:${h.hp} | Mana:${h.mana}</div>`).join('');
                            document.getElementById('hero_list').innerHTML = listStr;

                            const logDiv = document.getElementById('log');
                            logDiv.innerText = data.logs.slice(-20).join('\\n');
                        } catch (e) { 
                            console.error("Fetch Data Error:", e);
                            statusMsg.innerText = "Sync error: " + e.message;
                        }
                    }

                    async function handleStep() {
                        const originalMsg = statusMsg.innerText;
                        statusMsg.innerText = "Processing...";
                        try {
                            // Use a very simple fetch call
                            const res = await fetch('/step');
                            if (res.ok) {
                                statusMsg.innerText = "Success!";
                                fetchData();
                                setTimeout(() => { statusMsg.innerText = originalMsg; }, 800);
                            } else {
                                statusMsg.innerText = "Server Error: " + res.status;
                            }
                        } catch (e) {
                            console.error("Fetch Step Error:", e);
                            statusMsg.innerText = "Connection Failed";
                        }
                    }

                    fetchData();
                    setInterval(fetchData, 1000);
                </script>
            </body>
            </html>
            """
            self.wfile.write(content.encode())
        elif "/data" in path:
            # No need for separate call to _handle_preflight since we set headers above
            self.send_response(200)
            self.send_header("Content-type", "application/json")
            self.end_headers()
            res = {
                "state": engine.state, 
                "distance": engine.distance, 
                "timer": engine.timer, 
                "heart_time": engine.heart_time,
                "heroes": engine.heroes, 
                "logs": engine.logs
            }
            self.wfile.write(json.dumps(res).encode())
        elif "/step" in path:
            # No need for separate call to _handle_preflight
            engine.process()
            print(f"--- STEP TRIGGERED! Status: {engine.state} | Dist: {engine.distance}")
            self.send_response(200)
            self.send_header("Content-type", "application/json")
            self.end_headers()
            self.wfile.write(b'{"status":"ok"}')

    def do_OPTIONS(self):
        # Standard logic for CORS preflight
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

if __name__ == "__main__":
    # Force server to listen on all interfaces clearly
    server = HTTPServer(('0.0.0.0', 8000), DashboardHandler)
    print("Server is running on port 8000...")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
