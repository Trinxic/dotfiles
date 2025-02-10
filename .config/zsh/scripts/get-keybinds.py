from pathlib import Path

MAX_ACTIONS_LENGTH = 30

keybinds_path = f'{Path.home()}/.config/hypr/configs/keybinds.conf'

# Lists to store extracted values
keybinds_list = []
actions_list = []
descriptions_list = []

# Read the file
with open(keybinds_path, 'r') as f:
    for line in f:
        if line.startswith('bind = '):
            second_comma = line.find(',', line.find(',') + 1)
            keybinds = line[8:second_comma].strip()

            # Find comment position
            comment_index = line.find('#')

            # Extract actions (stop before # if it exists)
            if comment_index != -1:
                actions = line[second_comma + 2:comment_index].strip()
                description = line[comment_index:].strip('# \n')
            else:
                actions = line[second_comma + 2:].strip()
                description = "n/a"

            if len(actions) > MAX_ACTIONS_LENGTH:
                actions = actions[:MAX_ACTIONS_LENGTH - 3] + '...'

            # Store values
            keybinds_list.append(keybinds)
            actions_list.append(actions)
            descriptions_list.append(description)


# Find max lengths for alignment
max_keybind_len = max((len(k) for k in keybinds_list), default=9)
max_action_len = min(
    max(
        (len(a) for a in actions_list),
        default=8
    ),
    MAX_ACTIONS_LENGTH
)

print(
    '\n'
    + '\n'.join(
        header := [
            f"{'Keybinds'.center(max_keybind_len)} | "
            f"{'Actions'.center(max_action_len)} | Description",
            f"{'--------'.center(max_keybind_len, '-')}-|-"
            f"{'-------'.center(max_action_len, '-')}-|------------"
        ]
    )
)

# Print formatted output
for k, a, d in zip(keybinds_list, actions_list, descriptions_list):
    print(f'{k.ljust(max_keybind_len)} | {a.ljust(max_action_len)} | {d}')

print('\n'.join(header[::-1]))

if max_action_len == MAX_ACTIONS_LENGTH:
    print(f'\nIf you would like to see full descriptions, see: {keybinds_path}')
