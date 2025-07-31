class Record:
    def __init__(self, record_id, parent_id):
        self.record_id = record_id
        self.parent_id = parent_id


class Node:
    def __init__(self, node_id):
        self.node_id = node_id
        self.children = []


def BuildTree(records):
    if not records:
        return None

    records.sort(key=lambda x: x.record_id)

    if len(records) <= records[-1].record_id:
        raise ValueError("Record id is invalid or out of order.")

    nodes = {}
    root = None

    for record in records:
        if record.parent_id > record.record_id:
            raise ValueError("Node parent_id should be smaller than it's record_id.")

        if record.record_id not in nodes:
            nodes[record.record_id] = Node(record.record_id)

        if record.parent_id not in nodes:
            nodes[record.parent_id] = Node(record.parent_id)

        if record.record_id == record.parent_id:
            if root is None:
                root = nodes[record.record_id]
            else:
                raise ValueError("Only root should have equal record and parent id.")
        else:
            nodes[record.parent_id].children.append(nodes[record.record_id])

    if root is None:
        raise ValueError("Record id is invalid or out of order.")

    return root
