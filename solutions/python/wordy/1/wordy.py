OPERATIONS = {
    "plus": "+",
    "minus": "-",
    "multiplied by": "*",
    "divided_by": "/"
}

OPERANDS = ("+", "-", "*", "/")

def answer(question):
    question = question.lower()

    if not question.startswith("what is"):
        raise ValueError("unknown operation")

    question = question.replace("what is", "").replace("?", "").split()

    if not question:
        raise ValueError("syntax error")

    for operation, symbol in OPERATIONS.items():
        question = question.replace(operation, symbol)

    result = 0

    return result
