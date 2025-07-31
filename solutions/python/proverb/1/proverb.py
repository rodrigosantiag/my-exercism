def proverb(*input_data, qualifier):
    if not input_data:
        return []

    result = []
    first_item, items = input_data[0], list(input_data)

    while len(items) > 0:
        current_item, remaining = items.pop(0), items

        if remaining:
            result.append(f"For want of a {current_item} the {remaining[0]} was lost.")
        else:
            last_item = f"{qualifier} {first_item}" if qualifier else first_item
            result.append(f"And all for the want of a {last_item}.")

    return result
