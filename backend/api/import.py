for line in open("user.tsv", "r"):
    (userId, userCompany, userDiscountRate) = tuple(line[:-1].split("\t"))
    if userDiscountRate.isdigit():
        print("User.create(userId: \"" + userId + "\", userCompany: \"" + userCompany + "\", userDiscountRate: " + userDiscountRate + ")")
