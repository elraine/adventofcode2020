filename = "day1ex.txt"

def sol():
    with open(filename, 'r') as f:
        r = list(map(lambda x: int(x.strip("\n")),f.readlines()))
        for x in r:
            for y in r:
                if ((x+y) == 2020):
                    print(f"""{x*y}""")
                    return x*y

sol()

def sol2():
    with open(filename, 'r') as f:
        r = list(map(lambda x: int(x.strip("\n")),f.readlines()))
        for x,y,z in r,r,r:
            print(x,y,z)
            # for y in r.remove(x):
            #     for z in r.remove(x,y):
            #         if ((x+y+z) == 2020):
            #             print(f"""{x*y*z}""")
            #             return x*y*z

sol2()
