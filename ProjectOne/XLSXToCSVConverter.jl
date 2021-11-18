#!/usr/bin/env julia
#import XLSX ,DataFrames, CSV
using DataFrames, XLSX, CSV

function main() #main function to initialise Workflows
    print("OK, I'll open a xlsx with Julia and process every data sheet of it into a own CSV for you, ok? y/n: ") #this tool is terminal based
    while true #Never ending loop to let restart after mistakes
        trie = readline() #method to interact with the user
        if trie == "y" 
            println("ok, cool","\n \n","Please tell me the path of your file: ")
            while true # never ending
                pathstr = readline()
                if isdir(pathstr) == true
                    fileWorker(pathstr)
                    break
                else
                    print("please trie again: ")
                end
            end
        elseif trie == "n"
            print("good bye")
            break
        else
            print("Sorry, i didnt get it. please again [y/n]") #To determine, what the user want to do.
        end
    end
end

function fileWorker(path) #function to process the data sheets o f a xlsx into CSV files
    while true #never ending loop
        direkt = cd(path) #method to direkt into the given directory
        print("Please insert Filename: ")
        file = readline() #read user input
        if isfile(file) == true
            sfile = string(file) #cast the user input to a string
            try
                xf = XLSX.readxlsx(file) #Extract the the names of every Data sheet of a xlsx and turn it into an Array
                for v in XLSX.sheetnames(xf) #to iterate over the Data sheets
                    df = DataFrame(XLSX.readtable(sfile, v)...) #calls every Data sheet of a xlsx and turns into a table
                    CSV.write(string(sfile,v,".csv" ),df)   #writes every given table to into a csv file. The new product 
                                                        #contains the name of the origin xlsx, the data sheet and the ending of a CSV file
                    break
                end
            catch e
                print("given File can't proccessed. try different File: ")
            end
        else
            print("That's not a file. Please again: ")
        end
    end
end

main()