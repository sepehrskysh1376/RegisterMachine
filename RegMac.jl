println("Hello World!")
print("We are creating a user surface for Register Machine.\n\n")
print("\t\tRegister Machine\n")
print("\t\t----------------\n")
print("A machine that compute a specific function\nFor the function itself or a certain functionality.\n")
print("It asks you for the number of registers and
      then for each registers' value as initial configuration.\n\n")

function registers(RegNum) # Making the empty registers
    """
    Input
        n: The number of registers
    Output
        An array with 'n' 0 registers
    """
    print("The Minimum number of Registers you need is: $(RegNum+1)\n")
    print("Now, how many registers do you need?\n> ")
    n = parse(Int64, readline())
    return zeros(Int64, n)
end


function readProgram(filename) # Reading the Program
    lines = readlines(filename)
    RegsInProg = Set([])
    println("---------------------")
    Program = []
    Prog_num = []
    for line in lines
        println(line)
        if line[1] == '#'
            continue
        end
        p = split(line)
        c = 0
        pp = []
        for i in 1:length(p)
            c += 1
            if i == 3
                RegInt = parse(Int64, p[i])
                if RegInt ∉ RegsInProg
                    push!(RegsInProg, RegInt) 
                end
            end
            if c == 2
                push!(pp, p[i])
                continue
            end
            m = parse(Int64, p[i])
            push!(pp, m)
        end
        push!(Program, pp)
        push!(Prog_num, parse(Int64, p[1]))
    end
    println("Program Number: $Prog_num")

    return Program, Prog_num, maximum(RegsInProg)
end


function initialization(registeries) # Putting the initial Configuration for your registers
    println("\nPut the registeries:")
    for i in 1:length(registeries)
        if i == 1
            print("R$(i-1) (default is 1)> ")
        else
            print("R$(i-1)> ")
        end
        r = parse(Int64, readline())
        registeries[i] = r
    end
    println(registeries)
end

function functioning(program, registeries, program_number) # Run the Program for initial registers
    while true
        r0 = registeries[1]
        if r0 ∉  program_number
            println("r0 : $r0")
            break
        end
        p = program[r0]
        if p[2] == "D"
            sub_r = p[3]+1
            if registeries[sub_r] == 0
                registeries[1] = p[5]
            else
                registeries[sub_r] -= 1
                registeries[1] = p[4]
            end

        elseif p[2] == "I"
            add_r = p[3]+1
            registeries[add_r] += 1
            registeries[1] = p[4]
        end
        println(registeries)
    end
end

# Input file
print("\nThe files in the current directory:\n"); run(`ls`)
print("\nEnter the file name:\n> "); filename = readline()
prog, prog_num, RegsMinNum = readProgram(filename)

reg = registers(RegsMinNum)
println(reg)


println(prog)
initialization(reg)


functioning(prog, reg, prog_num)
