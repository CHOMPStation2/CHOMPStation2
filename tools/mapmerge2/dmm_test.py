import os
import sys

from tools.mapmerge2 import frontend
from .dmm import *

def green(text):
    return "\033[32m" + str(text) + "\033[0m"

def red(text):
    return "\033[31m" + str(text) + "\033[0m"

def has_tgm_header(fname):
    with open(fname, 'r', encoding=ENCODING) as f:
        data = f.read(len(TGM_HEADER))
        return data.startswith(TGM_HEADER)

class LintException(Exception):
    pass

def _self_test():
    count = 0
    failed = 0
    for dirpath, dirnames, filenames in os.walk(frontend.read_settings().map_folder):
        if '.git' in dirnames:
            dirnames.remove('.git')
        for filename in filenames:
            if filename.endswith('.dmm'):
                fullpath = os.path.join(dirpath, filename)
                path = fullpath.replace("\\", "/").removeprefix("./")
                try:
                    # test: can we load every DMM in the tree
                    DMM.from_file(fullpath)

                    # test: is every DMM in TGM format
                    if not has_tgm_header(fullpath):
                        raise LintException('Map is not in TGM format! Please run `/tools/mapmerge2/I Forgot To Map Merge.bat`')
                except LintException as error:
                    failed += 1
                    print(red(f'Failed on: {path}'))
                    print(error)
                except Exception:
                    failed += 1
                    print(red(f'Failed on: {path}'))
                    raise
                count += 1

    print(f"{os.path.relpath(__file__)}: {green(f'successfully parsed {count-failed} .dmm files')}")
    if failed > 0:
        print(f"{os.path.relpath(__file__)}: {red(f'failed to parse {failed} .dmm files')}")
        exit(1)


def _usage():
    print(f"Usage:")
    print(f"    tools{os.sep}bootstrap{os.sep}python -m {__spec__.name}")
    exit(1)


def _main():
    if len(sys.argv) == 1:
        return _self_test()

    return _usage()


if __name__ == '__main__':
    _main()
