from datetime import datetime
from colorama import init, Fore

init()

def now():
    return datetime.now().strftime("%H:%M:%S")
def today():
    return datetime.now().strftime("%Y-%m-%d")

def log(msg:str, exec:str="DEBUG", type:int=0):
    now_str = f"{today()} {now()}"
    logparts = [f'{Fore.LIGHTBLACK_EX}{now_str}{Fore.RESET}']
    if type == 0:
        logparts.append(f' {Fore.LIGHTWHITE_EX}DEBUG{Fore.RESET}  ')
    elif type == 1:
        logparts.append(f' {Fore.LIGHTBLUE_EX}INFO{Fore.RESET}   ')
    elif type == 2:
        logparts.append(f' {Fore.YELLOW}WARNING{Fore.RESET}')
    elif type == 3:
        logparts.append(f' {Fore.RED}ERROR{Fore.RESET}  ')
    logparts.append(f'{Fore.MAGENTA}{exec}{Fore.RESET}')
    logparts.append(f' {msg}')
    print("".join(logparts))