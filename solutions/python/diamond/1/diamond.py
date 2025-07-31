ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


def rows(letter):
    base_trail = ALPHABET.index(letter) * 2 + 1
    work_string = ALPHABET[:base_trail//2+1]
    result = ["A".center(base_trail)]

    for i in range(1, len(work_string)):
        space_between = (len(work_string[1:i]) * 2 + 1) * " "
        current_row = (work_string[i] + space_between + work_string[i]).center(base_trail)
        result.append(current_row)

    for rev in reversed(result[:-1]):
        result.append(rev)

    return result
