extends Node

var world_narrative = []

func start_dialogue(node_id: int) -> Dictionary:
    if node_id >= 0 and node_id < world_narrative.size():
        var entry = world_narrative[node_id]
        print(entry.get("speaker", "Unknown"), ": ", entry.get("line", ""))
        return entry
    else:
        print("Invalid dialogue node id")
        return {}

func get_next_line() -> String:
    return ""
