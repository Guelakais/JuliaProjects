#!/usr/bin/env julia
import XLSX ,DataFrames, CSV

function main() #main function to initialise Workflows
    print("OK, today, we're trying to open a xls in Julia and look what it does with it, ok? y/n: ") #this tool is terminal based
    while true #Never ending loop to let restart after mistakes
        trie = readline() #method to interact with the user
        if trie == "y" 
            println("ok, cool")
            fileWorker()
            break
        elseif trie == "n"
            print("good bye")
            break
        else
            print("Sorry, i didnt get it. please again [y/n]") #To determine, what the user want to do.
        end
    end
end

function fileWorker()
    print("Please tell me the path of your file: ")
    while true
        pathstr = readline()
        if isdir(pathstr) == true
            direkt = cd(pathstr)
            print("Please insert Filename: ")
            file = readline()
            sfile = string(file)
            xf = XLSX.readxlsx(file)
            for v in XLSX.sheetnames(xf)
                sh = xf[v]
                rt = XLSX.readtable(sfile, v)
                #CSV.write(string(sfile,v,".csv" ),df)
            end
            break
        else
            print("try it again")
        end      
        #else
    end
end

main()