import java.io.*;
import java.util.HashMap;

public class Assembler
{
    
    // static tables   
    static HashMap<String, String> compTable = new HashMap<>();
    static HashMap<String, String> destTable = new HashMap<>();
    static HashMap<String, String> jumpTable = new HashMap<>();

    public static void main(String[] args) throws Exception 
    {
        // working with files        
        if (args.length != 1)
        {
            System.out.println("Usage: java Assembler Program.asm");
            return;
        }

        makeTables();   // initialising tables

        String inputFile = args[0];
        String outputFile;

        if (inputFile.endsWith(".asm"))
        {
            outputFile = inputFile.substring(0, inputFile.length() - 4) + ".bin";
        } 
        else
        {
            outputFile = inputFile + ".bin";
        }

        BufferedReader input = new BufferedReader(new FileReader(inputFile));
        BufferedWriter output = new BufferedWriter(new FileWriter(outputFile));

        String line;

        // reading file
        while ((line = input.readLine()) != null)
        {
            // remove comments and spaces
            // comments CAN NOT go before the command
            if (line.contains("//"))
            {
                line = line.substring(0, line.indexOf("//"));
            }

            line = line.replaceAll("\\s", "");

            if (line.isEmpty())  continue;

            String binary;

            // processing Address instruction always starts with "@"", for example @17
            // parsing an instruction
            if (line.startsWith("@"))
            {
                String address = line.substring(1);

                if (!address.matches("[0-9]+"))
                {
                    System.out.println("Error: only number addresses are supported: " + line);
                    input.close();
                    output.close();
                    return;
                }

                int number = Integer.parseInt(address);

                if (number > 32767)
                {
                    System.out.println("Error: address is too large: " + line);
                    input.close();
                    output.close();
                    return;
                }

                binary = Integer.toBinaryString(number);

                while (binary.length() < 16)
                {
                    binary = "0" + binary; 
                }
            }

            // processing computational instruction, for example D=M or 0;JMP
            // parsing an instruction
            else 
            {
                String dest = "";
                String comp = "";
                String jump = "";

                if (line.contains("="))
                {
                    dest = line.substring(0, line.indexOf("="));
                    line = line.substring(line.indexOf("=") + 1);
                }

                if (line.contains(";"))
                {
                    comp = line.substring(0, line.indexOf(";"));
                    jump = line.substring(line.indexOf(";") + 1);
                }
                else
                {
                    comp = line;
                }

                if (!compTable.containsKey(comp) || !destTable.containsKey(dest) || !jumpTable.containsKey(jump)) 
                {
                    System.out.println("Error: invalid instruction: " + line);
                    input.close();
                    output.close();
                    return;
                }

                // translator 
                binary = "111" + compTable.get(comp) + destTable.get(dest) + jumpTable.get(jump);
            }

            output.write(binary);
            output.newLine();
        }

        input.close();
        output.close();

        System.out.println("Created " + outputFile);
    }


    static void makeTables()
    {
        compTable.put("0", "0101010");
        compTable.put("1", "0111111");
        compTable.put("-1", "0111010");
        compTable.put("D", "0001100");
        compTable.put("A", "0110000");
        compTable.put("M", "1110000");
        compTable.put("!D", "0001101");
        compTable.put("!A", "0110001");
        compTable.put("!M", "1110001");
        compTable.put("-D", "0001111");
        compTable.put("-A", "0110011");
        compTable.put("-M", "1110011");
        compTable.put("D+1", "0011111");
        compTable.put("A+1", "0110111");
        compTable.put("M+1", "1110111");
        compTable.put("D-1", "0001110");
        compTable.put("A-1", "0110010");
        compTable.put("M-1", "1110010");
        compTable.put("D+A", "0000010");
        compTable.put("D+M", "1000010");
        compTable.put("D-A", "0010011");
        compTable.put("D-M", "1010011");
        compTable.put("A-D", "0000111");
        compTable.put("M-D", "1000111");
        compTable.put("D&A", "0000000");
        compTable.put("D&M", "1000000");
        compTable.put("D|A", "0010101");
        compTable.put("D|M", "1010101");

        destTable.put("", "000");
        destTable.put("M", "001");
        destTable.put("D", "010");
        destTable.put("MD", "011");
        destTable.put("A", "100");
        destTable.put("AM", "101");
        destTable.put("AD", "110");
        destTable.put("AMD", "111");

        jumpTable.put("", "000");
        jumpTable.put("JGT", "001");
        jumpTable.put("JEQ", "010");
        jumpTable.put("JGE", "011");
        jumpTable.put("JLT", "100");
        jumpTable.put("JNE", "101");
        jumpTable.put("JLE", "110");
        jumpTable.put("JMP", "111");
    }
}

