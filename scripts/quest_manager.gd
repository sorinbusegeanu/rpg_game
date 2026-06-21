extends Node

enum QuestStatus { NOT_STARTED, ACTIVE, COMPLETED }

class Quest:
    var id: int
    var title: String
    var description: String
    var status: int
    var reward_gold: int
    var total_steps: int
    var current_step: int
    var required_items: Array

    func _init(_id, _title, _description, _status, _reward_gold, _total_steps, _required_items = []):
        id = _id
        title = _title
        description = _description
        status = _status
        reward_gold = _reward_gold
        total_steps = _total_steps
        current_step = 0
        required_items = _required_items

var available_quest_data = []
var active_quests = []

func _init():
    # Populate initial quest data
    active_quests.append(Quest(0, "The Rooted Fear", "Investigate the whispers in the deep wood.", QuestStatus.ACTIVE, 500, 3))
    active_quests.append(Quest(1, "Hunt the Shadow", "Defeat the corrupted ones to find your path.", QuestStatus.ACTIVE, 1000, 1))

func check_progress():
    for q in active_quests:
        if q.current_step >= q.total_steps and q.status != QuestStatus.COMPLETED:
            q.status = QuestStatus.COMPLETED
            print("Quest Completed: ", q.title)

func progress_quest(quest_id):
    for q in active_quests:
        if q.id == quest_id:
            q.current_step += 1
            print("Progressed: ", q.title, " Step: ", q.current_step)
            check_progress()
            return
