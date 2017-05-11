import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;


public class Patrula {

    public String fileName;


    public static int compute(GraphT graphT, int startNode, int goalNode) {
        int roads = 0;
        if(startNode == goalNode){
            System.out.println("Goal Node Found!");
            System.out.println(startNode);
        }

        Queue<Integer> queue = new LinkedList<>();
        Set<Integer> explored = new HashSet<>();
        queue.add(startNode);
        //explored.add(startNode);
        int theNeighbours = 1;
        int count = 0;
        while(!queue.isEmpty()){
            int current = queue.remove();
            if(current == (goalNode)) {
                //System.out.println(explored);
                roads += 1;
            }
            else{
                List<Integer> nei = graphT.getNeighboursOf(current);
                queue.addAll(nei);
                theNeighbours += nei.size();
            }
            if(!explored.add(current))
                ;
        }

        return roads;
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
                System.out.print(fstCity + " ");
                int sndCity = Integer.parseInt((current.substring(current.indexOf(" ") + 1)));
                System.out.println(sndCity);
                grapht.addEdge(fstCity, sndCity);
                grapht.addEdge(sndCity, fstCity);
            }

            grapht.printGraph(grapht);

            int x = compute(grapht, numNodes, 1);
            if(x != 0)
                System.out.println("Drumuri gasite - " + x);;



        }
        catch (IOException e){
            e.printStackTrace();
        }
    }


}
