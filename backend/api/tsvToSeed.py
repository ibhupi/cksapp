for i, line in enumerate(open("country.tsv", "r")):
    if i == 0:
        column_names = line[:-1].split("\t")
    else:
        column_values = line[:-1].split("\t")
        # country.tsv
        print("Country.create(name: \"" + column_values[1] + "\", photo: " + column_values[2] + ")")
        # print("Location.create(title: \"" + column_values[1] + "\", " +
        #                 "lattitude: \"" + column_values[2] + "\", " +
        #                 "longitude: \"" + column_values[3] + "\", " +
        #                 "description: \"" + column_values[4] + "\", " +
        #                 "ranking: " + column_values[5] + ", " +
        #                 "photo: " + column_values[6] + ")")
        # print("Player.create(name: \"" + column_values[1] + "\", " +
        #             "gender: \"" + column_values[2] + "\", " +
        #             "gamesList: \"" + column_values[3] + "\", " +
        #             "country: " + column_values[4] + ", " +
        #             "photo: " + column_values[5] + ")")
