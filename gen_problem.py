#!env python3

import sys
import re
from urllib import request

URL = "https://projecteuler.net/problem={0}"

TEMPLATE = """-- {url}
--
-- {title}
--
-- {subtitle}
-- 
{description}
--

module Main where

main :: IO ()

"""


def strip_tags(text):
    return re.sub('<[^<]+?>', '', text)


def main(problem_id):
    url = URL.format(problem_id)
    response = request.urlopen(url)
    content = response.read().decode("utf-8")
    title = re.search(r"<h2>(.+?)</h2>", content)
    subtitle = re.search(r"<h3>(.+?)</h3>", content)
    matches = re.findall(r"<p>(.+?)</p>", content)

    description = []
    for desc in matches:
        description.append("-- {0}".format(strip_tags(desc)))
    description = "\n".join(description)
    params = {"title":title.group(1), "subtitle":subtitle.group(1), 
            "description":description, "url": url}

    print(TEMPLATE.format(**params))


if __name__ == '__main__':
    main(sys.argv[1])
