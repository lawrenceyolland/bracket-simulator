# Atlantic Division

# tampa_bay_lightning = ["Nikita Kucherov", "Steven Stamkos", "J.T. Miller", "Anthony Cirelli", "Erik Cernak"]
# boston_bruins = ["Brad Marchand", "Zdeno Chara", "David Pastrnak", "Patrice Bergeron", "Charlie McAvoy"]
# toronto_maple_leafs = ["Auston Matthews", "John Taveres", "Mitch Marner", "William Nylander", "Patrick Marleau"]
# montreal_canadiens = ["Shea Weber", "Max Domi", "Tomas Tatar", "Jesperi Kotkaniemi", "Jonathan Drouin"]
# florida_panthers = ["Aleksander Barkov", "Jonathan Huberdeau", "Mike Hoffman", "Evgenii Dadonov", "Keith Yandle"]
# buffalo_sabres = ["Jack Eichel", "Johan Larsson", "Sam Reinhart", "Jess Skinner", "Rasmus Dahlin"]
# detroit_redwings = ["Dylan Larkin", "Niklas Kronwall", "Luke Glendening", "Andreas Athanasiou", "Tyler Bertuzzi"]
# ottawa_senators = ["Thomas Chabot", "Chris Tierney", "Brady Tkachuk", "Bobby Ryan", "Colin White"]

# Metropolitan Division

# washington_capitals = ["Alexander Ovechkin", "Tom Wilson", "T.J. Oshie", "Nicklas Backstrom", "Evgeny Kuznetsov"]
# new_york_islanders = ["Jordan Eberle", "Matthew Barzal", "Josh Bailey", "Devon Toews", "Brock Nelson"]
# pittsburgh_penguins = ["Sidney Crosby", "Phil Kessel", "Jake Guentzel", "Evgeni Malkin", "Kris Letang"]
# carolina_hurricanes = ["Teuvo Teravainen", "Sebastian Aho", "Warren Foegele", "Jordan Staal", "Justin Williams"]
# columbus_blue_jackets = ["Artemi Panarin", "Matt Duchene", "Seth Jones", "Cam Atkinson", "Zach Werenski"]
# philadelphia_flyers = ["Claude Giroux", "Sean Couturier", "Jakub Voracek", "Shayne Gostisbehere", "Travis Konecny"]
# new_york_rangers = ["Mika Zibanejad", "Chris Kreider", "Pavel Buchnevich", "Jimmy Vesey", "Ryan Strome"]
# new_jersey_devils = ["Kyle Palmieri", "Andy Greene", "Travis Zajac", "Will Butcher", "Damon Severson"]

# Central Division

# nashville_predators = ["P.K. Subban", "Roman Josi", "Ryan Ellis", "Ryan Johansen", "Filip Forsberg"]
# winnipeg_jets = ["Blake Wheeler", "Mark Scheifele", "Kyle Connor", "Patrik Laine", "Dustin Byfuglien"]
# st_louis_blues = ["Ryan O'Reilly", "Jaden Schwartz", "Alex Pietrangelo", "Vladimir Tarasenko", "David Perron"]
# dallas_stars = ["Tyler Seguin", "Mats Zuccarello", "Alexander Radulov", "Jamie Benn", "John Klingberg"]
# colorado_avalanche = ["Mikko Rantanen", "Nathan MacKinnon", "Gabriel Landeskog", "Cale Makar", "Patrick Roy"]
# chicago_blackhawks = ["Patrick Kane", "Johnathan Toews", "Erik Gustafsson", "Alex DeBrincat", "Duncan Keith"]
# minnesota_wild = ["Zach Parise", "Eric Staal", "Ryan Suter", "Mikko Koivu", "Jason Zucker"]

# Pacific Division

# calgary_flames = ["Johnny Gaudreau", "Sean Monohan", "Matthew Tkachuk", "Elias Lindholm", "Mark Giordano"]
# san_jose_sharks = ["Erik Karlsson", "Brent Burns", "Logan Couture", "Evander Kane", "Joe Thornton"]
# las_vegas_golden_knights = ["Johnathan Marchessault", "Mark Stone", "Max Pacioretty", "William Karlsson", "Reilly Smith"]
# arizona_coyotes = ["Oliver Ekman-Larsson", "Clayton Keller", "Alex Galchenyuk", "Vinnie Hinostroza", "Derek Stepan"]
# vancouver_canucks = ["Elias Pettersson", "Brock Boeser", "Bo Horvat", "Alexander Edler", "Antoine Roussel"]
# anaheim_ducks = ["Ryan Getzlav", "Jakob Silfverberg", "Rickard Rakell", "Adam Henrique", "Nick Ritchie"]
# edmonton_oilers = ["Connor McDavid", "Leon Draisaitl", "Ryan Nugent-Hopkins", "Darnell Nurse", "Alex Chiasson"]
# los_angeles_kings = ["Drew Doughty", "Anze Kopitar", "Dustin Brown", "Ilya Kovalchuk", "Tyler Toffoli"]

# default_team = ["Grayne Wetzky", "Doug 'The Thug' Glatt", "Ross 'The Boss' Rhea", "Happy Gilmore", "Gordan Bombay"]

# Reformatted to array of arrays...
def player_array # reformatted from players
        
    player_array = [["Nikita Kucherov", "Steven Stamkos", "J.T. Miller", "Anthony Cirelli", "Erik Cernak"],["Brad Marchand", "Zdeno Chara", "David Pastrnak", "Patrice Bergeron", "Charlie McAvoy"],["Auston Matthews", "John Taveres", "Mitch Marner", "William Nylander", "Patrick Marleau"],["Shea Weber", "Max Domi", "Tomas Tatar", "Jesperi Kotkaniemi", "Jonathan Drouin"],["Aleksander Barkov", "Jonathan Huberdeau", "Mike Hoffman", "Evgenii Dadonov", "Keith Yandle"],["Jack Eichel", "Johan Larsson", "Sam Reinhart", "Jess Skinner", "Rasmus Dahlin"],["Dylan Larkin", "Niklas Kronwall", "Luke Glendening", "Andreas Athanasiou", "Tyler Bertuzzi"],["Thomas Chabot", "Chris Tierney", "Brady Tkachuk", "Bobby Ryan", "Colin White"],["Alexander Ovechkin", "Tom Wilson", "T.J. Oshie", "Nicklas Backstrom", "Evgeny Kuznetsov"],["Jordan Eberle", "Matthew Barzal", "Josh Bailey", "Devon Toews", "Brock Nelson"],["Sidney Crosby", "Phil Kessel", "Jake Guentzel", "Evgeni Malkin", "Kris Letang"],["Teuvo Teravainen", "Sebastian Aho", "Warren Foegele", "Jordan Staal", "Justin Williams"],["Artemi Panarin", "Matt Duchene", "Seth Jones", "Cam Atkinson", "Zach Werenski"],["Claude Giroux", "Sean Couturier", "Jakub Voracek", "Shayne Gostisbehere", "Travis Konecny"],["Mika Zibanejad", "Chris Kreider", "Pavel Buchnevich", "Jimmy Vesey", "Ryan Strome"],["Kyle Palmieri", "Andy Greene", "Travis Zajac", "Will Butcher", "Damon Severson"],["P.K. Subban", "Roman Josi", "Ryan Ellis", "Ryan Johansen", "Filip Forsberg"],["Blake Wheeler", "Mark Scheifele", "Kyle Connor", "Patrik Laine", "Dustin Byfuglien"],["Ryan O'Reilly", "Jaden Schwartz", "Alex Pietrangelo", "Vladimir Tarasenko", "David Perron"],["Tyler Seguin", "Mats Zuccarello", "Alexander Radulov", "Jamie Benn", "John Klingberg"],["Mikko Rantanen", "Nathan MacKinnon", "Gabriel Landeskog", "Cale Makar", "Patrick Roy"],["Patrick Kane", "Johnathan Toews", "Erik Gustafsson", "Alex DeBrincat", "Duncan Keith"],["Zach Parise", "Eric Staal", "Ryan Suter", "Mikko Koivu", "Jason Zucker"],["Johnny Gaudreau", "Sean Monohan", "Matthew Tkachuk", "Elias Lindholm", "Mark Giordano"],["Erik Karlsson", "Brent Burns", "Logan Couture", "Evander Kane", "Joe Thornton"],["Johnathan Marchessault", "Mark Stone", "Max Pacioretty", "William Karlsson", "Reilly Smith"],["Oliver Ekman-Larsson", "Clayton Keller", "Alex Galchenyuk", "Vinnie Hinostroza", "Derek Stepan"],["Elias Pettersson", "Brock Boeser", "Bo Horvat", "Alexander Edler", "Antoine Roussel"],["Ryan Getzlav", "Jakob Silfverberg", "Rickard Rakell", "Adam Henrique", "Nick Ritchie"],["Connor McDavid", "Leon Draisaitl", "Ryan Nugent-Hopkins", "Darnell Nurse", "Alex Chiasson"],["Drew Doughty", "Anze Kopitar", "Dustin Brown", "Ilya Kovalchuk", "Tyler Toffoli"],["Grayne Wetzky", "Doug 'The Thug' Glatt", "Ross 'The Boss' Rhea", "Happy Gilmore", "Gordan Bombay"]]
end
