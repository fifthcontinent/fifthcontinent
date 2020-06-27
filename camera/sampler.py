import subprocess
import os
import re

from PIL import Image

SOURCE_IMAGE = os.environ.get("SOURCE_IMAGE", "/home/pi/fifthcontinent/image.jpg")
TARGET_CSS = os.environ.get(
    "TARGET_CSS", "/home/pi/fifthcontinent/html/assets/css/styles.css"
)


def get_image():
    subprocess.run("raspistill -o {}".format(SOURCE_IMAGE), shell=True)


def add_to_css():
    with open(SOURCE_IMAGE, "rb") as f:
        img = Image.open(f)
        img2 = img.resize((1, 1))
    color = img2.getpixel((0, 0))
    bodycolour = r"(body { background-color: )([#0-9a-f]+)"
    with open(TARGET_CSS, "r+") as f:
        contents = f.read()
        colour = "#{:02x}{:02x}{:02x}".format(*color)
        result = re.sub(bodycolour, r"\1" + colour, contents)
        f.seek(0)
        f.truncate()
        f.write(result)


if __name__ == "__main__":
    get_image()
    add_to_css()
