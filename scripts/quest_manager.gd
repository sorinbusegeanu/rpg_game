extends Node

# The Quest Manager tracks player progress and goals.
# It manages objectives, status (Not Started, Active, Completed), and rewards.

enum QuestStatus { NOT_STARTED, ACTIVE, COMPLETED }

class Quest:
	var id: int
	var title: String
	var description: String
	var status: int
	var reward_gold: int
	var current_step: int
	var total_steps: int
	var required_items: Array # Items needed for quest completion

func _init():
	pass

# The list of all quests in the game.
var active_quests = []
var available_quest_data = []

func _init():
	# Define some initial quests
	# Quest 1: Exploration of the inner forest
	active_quester.push(Quest(0, "The Rooted Fear", "Investigate the whispers in the deep wood.", 0, 500, 3))
	# Quest 2: Hunting a specific monster
	active_quester.push(Quest(1, "Hunt the Shadow", "Defeat the corrupted ones to find your path.", 0, 1000, 1))

# Check if any quests are completed and grant rewards.
func check_progress():
	for quest in active_quests:
		if quest.current_step >= quest.total_steps:
			print("Quest Completed: " + quest.title)
			# Update inventory/gold logic here
fi

# Link a dialogue trigger to the quest system.
func progress_quest(quest_id: int):
	for q in active_quests:
		if q.id == quest_id:
            q.current_step += 1
            print("Progressed " + q.title + " to step " + str(q.current_step))
fi

# List of quests currently being tracked by the player
var active_quester = [] # Note: using 'active_quester' as a distinct name for list if needed, but keeping it standard
__type_info__ = 0
