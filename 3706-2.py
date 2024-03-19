
from math import sqrt
import matplotlib.pyplot as plt

def distance(x1, y1, x2, y2):
    return sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)

def classify_points(points, coordinates):
    alist = []
    blist = []
    clist = []
    dlist = []

    for (x, y) in coordinates:
        dist_to_A = distance(x, y, *points['A'])
        dist_to_B = distance(x, y, *points['B'])
        dist_to_C = distance(x, y, *points['C'])
        dist_to_D = distance(x, y, *points['D'])
        
        min_dist = min(dist_to_A, dist_to_B, dist_to_C, dist_to_D)
        if min_dist == dist_to_A:
            alist.append((x, y))
        elif min_dist == dist_to_B:
            blist.append((x, y))
        elif min_dist == dist_to_C:
            clist.append((x, y))
        else:
            dlist.append((x, y))
    
    distances_A = [distance(point[0], point[1], *points['A'] ) for point in alist]
    distances_B = [distance(point[0], point[1], *points['B']) for point in blist]
    distances_C = [distance(point[0], point[1], *points['C']) for point in clist]
    distances_D = [distance(point[0], point[1], *points['D']) for point in dlist]

    distances = sum(distances_A) + sum(distances_B) + sum(distances_C) + sum(distances_D)
    return alist, blist, clist, dlist, distances


def average_point(points_list):
    x_sum, y_sum = 0, 0
    for (x, y) in points_list:
        x_sum += x
        y_sum += y
    
    avg_x = x_sum / len(points_list)
    avg_y = y_sum / len(points_list)
    
    return avg_x, avg_y


def new_point(points,alist,blist,clist,dlist):
    avg_A = average_point(alist)
    avg_B = average_point(blist)
    avg_C = average_point(clist)
    avg_D = average_point(dlist)

    points = {'A': avg_A, 'B': avg_B, 'C': avg_C, 'D': avg_D}
    return points


points = {'A': (2, 2), 'B': (4, 6), 'C': (6, 5), 'D': (8, 8)}

coordinates = [(2,5),(3,2),(3,3),(3,4),(4,3),(4,4),(6,3),(6,4),
               (6,6),(7,2),(7,5),(7,6),(7,7),(8,6),(8,7)]

avg_values = []

for i in range(1, 11):
    alist, blist, clist, dlist, distances = classify_points(points, coordinates)
    points = new_point(points, alist, blist, clist, dlist)
    AVG = distances / 15
    print("AVG: ", AVG)
    avg_values.append(AVG)


plt.plot(range(1, 11), avg_values, marker='o', color='blue')
plt.xlabel('Times')
plt.ylabel('AVG Value')
plt.title('AVG Value vs Times')
plt.grid(True)
plt.show()
