import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["year", "fuel_consumption", "milage", "mark"]

def generate_row():

    return {
        "year": random.randint(2000, 2025),
        "fuel_consumption": round(random.uniform(4.5, 20.0), 2),
        "milage": random.randint(0, 300),
        "mark": random.choice(["Mercedes", "BMW", "Lada", "Kia", "Audi", "Moskvich"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

