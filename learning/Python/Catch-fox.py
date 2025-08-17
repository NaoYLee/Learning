
# todo 5个洞，狐狸每晚随机跳向相邻的洞，每天一次检查机会
import random

# : 初始化洞穴状态
holes = {1:'empty', 2:'empty', 3:'empty', 4:'empty', 5:'empty'}
# : 初始化狐狸
fox_hole = random.randint(1, 5)
holes[fox_hole] = 'fox'

while True:
    # : 调试
    print(f"狐狸移动到了洞 {fox_hole}")
    
    # : 设定检查的洞穴
    check_fox = int(input('请输入要检查的洞穴（1-5）：'))

    # : 检查输入合法性
    if check_fox > 5 or check_fox < 1:
        print('这里没有这个洞')
        continue

    # : 抓住狐狸
    if holes.get(check_fox) == 'fox':
        print('你抓住狐狸了！')
        break
    # : 狐狸转移
    else:
        print('狐狸不在这个洞里')
        if fox_hole == 1:
            holes[1] = 'empty'
            holes[2] = 'fox'
            fox_hole += 1
        elif fox_hole == 5:
            holes[5] = 'empty'
            holes[4] = 'fox'
            fox_hole -= 1
        else:
            change = int(random.choice([-1, 1]))
            holes[fox_hole] = 'empty'
            fox_hole = fox_hole + change
            holes[fox_hole] = 'fox'