L = 3
border = 0
for i in range(3,60,2):
    border += L*4
    L +=2
    border -=4
    print(L)
stacks = border/64
cofres2 = stacks/54
print(f"""        \n  se necesitan: {border} bloques
            O lo que es lo mismo: {stacks} stacks
            O lo que es lo mismo: {cofres2} cofres dobles de material """)
