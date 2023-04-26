
import java.io.*;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.stream.Stream;

class ResponseEntry {

    Integer minTime;
    String path;

    public ResponseEntry() {
        path = null;
        minTime = Integer.MAX_VALUE;
    }

    public ResponseEntry(int minTime, String path) {
        this.minTime = minTime;
        this.path = path;
    }

    @Override
    public String toString() {
        return "ResponseEntry{" + "minTime=" + minTime + ", path=" + path + '}';
    }

}

class WorkerThread implements Callable<ResponseEntry> {

    private final int arr[][];
    private final Set<Integer> visited;
    private String path;
    private final int currentCity;
    private int total;
    private final int N;

    public WorkerThread(int arr[][], Set<Integer> visited, String path, int currentCity, int total, int N) {
        this.arr = arr;
        this.visited = visited;
        this.path = path;
        this.currentCity = currentCity;
        this.total = total;
        this.N = N;
    }

    private void log(String msg) {
        System.out.println(Thread.currentThread().getName() + ": " + msg);
    }

    private ResponseEntry helper(int arr[][], Set<Integer> visited, String path, int currentCity, int total, int N) {
        ResponseEntry res = new ResponseEntry();
        ResponseEntry temp;
        for (int buildingId = 0; buildingId < N; buildingId++) {
            // currentCity is the city in which you are right now.
            if (!visited.contains(buildingId) && buildingId != currentCity) {   // 3 != 2 | d != c

                // a > b > c > d
                visited.add(buildingId);

                // if this is true then it means we have one potential solution.
                if (visited.size() == N) {

                    total = total + arr[currentCity][buildingId] + arr[buildingId][0];

                    if (res.minTime > total) {
                        res.path = path + " > " + buildingId + " > 0";
                        res.minTime = total;
                    }

                } else {
                    temp = helper(arr, visited, path + " > " + buildingId, buildingId, total + arr[currentCity][buildingId], N);

                    if (res.minTime > temp.minTime) {
                        res = temp;
                    }

                }

                // just to go backward
                visited.remove(buildingId);
            }

        }
        return res;
    }

    @Override
    public ResponseEntry call() throws Exception {

        try {

            ResponseEntry res, temp;
            res = new ResponseEntry();

            for (int buildingId = 0; buildingId < N; buildingId++) {
                // currentCity is the city in which you are right now.
                if (!visited.contains(buildingId) && buildingId != currentCity) {   // 3 != 2 | d != c

                    // a > b > c > d
                    visited.add(buildingId);

                    // if this is true then it means we have one potential solution.
                    if (visited.size() == N) {
//                        path = path + " > " + buildingId;
//                        System.out.print("Path: ");
//                        System.out.println(visited);
//                        System.out.println(path + " > " + buildingId + " > 0");
                        total = total + arr[currentCity][buildingId] + arr[buildingId][0];
//                        System.out.println("Total: " + total);

                        if (res.minTime > total) {
                            res.path = path + " > " + buildingId + " > 0";
                            res.minTime = total;
                        }

                    } else {

                        temp = helper(arr, visited, path + " > " + buildingId, buildingId, total + arr[currentCity][buildingId], N);

                        if (res.minTime > temp.minTime) {
                            res = temp;
                        }

                    }

                    // just to go backward
                    visited.remove(buildingId);
                }

            }

            return res;

        } catch (Exception ex) {
            ex.printStackTrace();
        }


        return new ResponseEntry();
    }

}

public class ShortestPathMultiThreading {

    public static void main(String[] args) throws InterruptedException, ExecutionException, IOException {
       String fileName ="src"+ File.separator + args[0] + ".txt";
        LinkedHashMap<String, String> map = new LinkedHashMap<>();
        LinkedHashMap<String, int[]> cleanMatrix = new LinkedHashMap<>();
        String line = "";
        int z = 0;
        int total = 0;

        BufferedReader reader = new BufferedReader(new FileReader(fileName));
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(":", 2);
            if (parts.length >= 2) {
                String key = parts[0];
                String value = parts[1];
                map.put(key, value);
            } else {
                System.out.println("ignoring line: " + line);
            }
        }

        Set<String> keys = map.keySet();
        List<String> listKeys = new ArrayList<>(keys);

        for (String s : map.values()) {
            int[] splitInt = Stream.of(s.trim().split(" "))
                    .mapToInt(Integer::parseInt)
                    .toArray();
            cleanMatrix.put(listKeys.get(z), splitInt);
            z += 1;
        }
        reader.close();
        Collection<int[]> theValues = cleanMatrix.values();
        int[][] arr = theValues.toArray(new int[0][0]);

        int N = arr.length;     // 12
        ResponseEntry ans = getShortestPath(arr, 0, 0, N);
       // System.out.println("Answer: " + ans);

        String finalResult = "";
        String actualBuilding = "";
        int currentBuilding;
        // abc jkl mno ghi def abc 14
        // abc jkl mno ghi def 0
        String[] arrayFormat =ans.path.replace(" > "," " ).split(" ");
        for (z = 0; z < arrayFormat.length ; z++ ) {
            currentBuilding = Integer.parseInt(arrayFormat[z]);
            actualBuilding = (String) keys.toArray()[currentBuilding];
            finalResult += actualBuilding;
        }
//        finalResult += arrayFormat[arrayFormat.length - 1];
        finalResult += ans.minTime;
        FileOutputStream fos = new FileOutputStream(new File("output2.txt"), false);
        fos.write(finalResult.getBytes());
        fos.flush();
        fos.close();


    }

    // a > b > c > d > a
    // a > b > d > c > a
    private static ResponseEntry getShortestPath(int arr[][], int currentCity, int total, int N) throws InterruptedException, ExecutionException {
        try {
            // keep track of cities visited
            Set<Integer> visited = new HashSet<>();

            // 0 is id of first city. In our case a
            visited.add(0);

            // 0 > 3 > 1 > 2 > 0
            String path = "0";

            // creating thread pool of size N
            ExecutorService es = Executors.newFixedThreadPool(N);
            List<Future<ResponseEntry>> futures = new ArrayList<>();
            for (int buildingId = 1; buildingId < N; buildingId++) {
                visited.add(buildingId);
                Set<Integer> v = new HashSet<>(visited);
                WorkerThread wt = new WorkerThread(arr, v, path + " > " + buildingId, buildingId, total + arr[currentCity][buildingId], N);
                Future<ResponseEntry> future = es.submit(wt);
                futures.add(future);
                visited.remove(buildingId);
            }
            int ans = Integer.MAX_VALUE;
            ResponseEntry answer = null;
            ResponseEntry temp;
            for (Future<ResponseEntry> f : futures) {
//                System.out.println("Getting data for: " + f);
                temp = f.get();
                if (ans > temp.minTime) {
                    ans = temp.minTime;
                    answer = temp;
                }
            }

            es.shutdown();
            return answer;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return new ResponseEntry();
    }

}
