import time

log = """
🛠️ Simulated hardware initialized.
UART: ⚠️ High Temperature Detected!
"""

with open("hil/test_output.log", "w") as f:
    for line in log.strip().split("\n"):
        print(line)
        f.write(line + "\n")
        time.sleep(0.5)
