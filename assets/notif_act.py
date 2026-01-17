import subprocess

if __name__ == "__main__":
    # Choose a notification.
    notif_list = subprocess.run(["fnottctl", "list"], stdout=subprocess.PIPE).stdout
    chosen_notif = list(
        subprocess.run(
            ["wofi", "-d"], stdout=subprocess.PIPE, input=notif_list
        ).stdout.decode()
    )
    idx: int = 0
    while any(
        chosen_notif[idx + 1] == i
        for i in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    ):
        idx += 1
    notif_id = ""
    for i in range(idx + 1):
        notif_id += chosen_notif[i]

    # Act on it.
    # Fnott choses the action with wofi on it's own, so we don't need to pass it again, this is enough.
    _ = subprocess.run(["fnottctl", "act", notif_id])
    exit()
