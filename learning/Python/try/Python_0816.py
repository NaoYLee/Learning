my_str = input('请输入字符串：')
i = 0

while i < len(my_str):
    if i % 2 == 0:
        print(my_str[i])
    i += 1
print(my_str[0::2])

name_list = ['Tom', 'Lily', 'Rose']
name = input('请输入想要搜索的名字：')

for i in name_list:
    if i == name:
        print(f'您输入的名字是{name}，名字已经存在')
        break
else:
    print(f'您输入的名字是{name}，名字不存在')