import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;


public class Patrula {

    public String fileName;


    public static boolean compute(GraphT graphT, int startNode, int goalNode) {
        if(startNode == goalNode){
            System.out.println("Goal Node Found!");
            System.out.println(startNode);
        }

        Queue<Integer> queue = new LinkedList<>();
        ArrayList<Integer> explored = new ArrayList<>();
        queue.add(startNode);
        explored.add(startNode);

        while(!queue.isEmpty()){
            int current = queue.remove();
            if(current == (goalNode)) {
                System.out.println(explored);
                return true;
            }
            else{
                if(graphT.getNeighboursOf(current).isEmpty())
                    return false;
                else
                    queue.addAll(graphT.getNeighboursOf(current));
            }
            explored.add(current);
        }

        return false;
    }

    public static void main(String[] args)
    {

        String current = null;
        try {
            BufferedReader br = null;
            br = new BufferedReader(new FileReader("C:\\Users\\badeaf\\Accurity\\tema2PA\\src\\text.in"));
            // graph to build and return
            String fst = br.readLine();
            int numNodes = Integer.parseInt(fst.substring(0,fst.indexOf(" ")));
            System.out.println(numNodes+1);
            int numRoads = Integer.parseInt((fst.substring(fst.indexOf(" ") + 1)));
            GraphT grapht = new GraphT(numNodes+1);
            for (int i = 0; i < numRoads; i++) {
                current = br.readLine();
                int fstCity = Integer.parseInt(current.substring(0,current.indexOf(" ")));
                System.out.println(fstCity);
                int sndCity = Integer.parseInt((current.substring(current.indexOf(" ") + 1)));
                System.out.println(sndCity);
                grapht.addEdge(fstCity, sndCity);
                grapht.addEdge(sndCity, fstCity);
            }
            if(compute(grapht, numNodes, 1))
                System.out.println("Drun gasit");;
            grapht.printGraph(grapht);

        }
        catch (IOException e){
            e.printStackTrace();
        }
    }


}