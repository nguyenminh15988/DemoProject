# person = {
#     'name': 'Vũ Thanh Tài',
#     'age': 22,
#     'male': True,
#     'status': 'alone'        
#     }

# del person ['status']

# print(person)

# name = "nguyen tam minh"
# for i in name:
#     print(i)

# name = "nguyentamminh"
# for i in range(0,14):
#     for j in range(i,14):
#         print(j, end = " ")
#     print("")

for i in "guyentaminh":
    if i == "n":
        break
    print(i, end=" ")

# a=""
# def say(a):
#     a = "Hello Minh"
#     print(a)
# say(a)

# a = "hello"
# def say():
#     global a
#     a = "Minh dep trai"
#     print(a)

# say()
# print(a)


def get_num(*num): #*num vi minh khong biet chinh xác bao nhiêu tham số truyền vào
    tmp = 0
    for i in num:
        tmp += i 
    return tmp

result = get_num(1, 2, 3, 7, 8)
print(result)


def sum(a,b):
    return a / b

try:
    print(sum(6,0))
except ZeroDivisionError:
    print('co loi xay ra')
finally:
    print('ngon lanh')


string = "nguyentamminh"
print(string.count('m'));



