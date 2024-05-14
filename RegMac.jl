println("Hello Sepehr!")
print("We are creating a user surface for Register Machine.\n\n")
print("\t\tRegister Machine\n")
print("\t\t----------------\n")
print("A machine that computate a specific function\nfor the function itself or a certain functionality.\n")
print("It asks you for the number of registers and
      then for each registers' value as initial configuration.\n\n")

function registers()
    """
    Input
        n: The number of registers
    Output
        An array with 'n' registers
    """
    print("Howmany register do you need?\n> ")
    n = parse(Int64, readline())
    return zeros(Int64, n)
end


function readProgram(filename)
    lines = readlines(filename)
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

    return Program, Prog_num
end


function initialization(registeries)
    println("\nPut the registeries:")
    for i in 1:length(registeries)
        print("R$(i-1)> ")
        r = parse(Int64, readline())
        registeries[i] = r
    end
    println(registeries)
end

function functioning(program, registeries, program_number)
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


reg = registers()
println(reg)

prog, prog_num = readProgram("PowerMine2.txt")
println(prog)
initialization(reg)

functioning(prog, reg, prog_num)
