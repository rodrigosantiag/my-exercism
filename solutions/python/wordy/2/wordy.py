import re
OPS = {
    "plus": "__add__", "minus": "__sub__",
    "multiplied": "__mul__", "divided": "__truediv__"
}
def answer(question):
    question = question.removeprefix("What is").removesuffix("?").strip()
    # question = question.strip("What is").strip("?").strip()
    if not question: raise ValueError("syntax error")
    # if only a digit, return it
    if question.isdigit(): return int(question)
    # process one or more operations
    ret = re.split(' by | ', question)
    if len(ret) == 2:
        if ret[1] not in OPS.keys(): raise ValueError("unknown operation")
        raise ValueError("syntax error")
    while len(ret) > 1:
        try:
            x, op, y, *tail = ret
            if op not in OPS.keys() and not op.isnumeric():
                raise ValueError("unknown operation")
            op = OPS[op]
            # put result as first element and append what remains
            ret = [int(x).__getattribute__(op)(int(y)), *tail]
        except Exception as e:
            if repr(e) == "ValueError('unknown operation')": raise e
            else: raise ValueError("syntax error")
    return ret[0]
