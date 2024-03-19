
# function distance(x1, y1, x2, y2)
#     return sqrt((x2 - x1)^2 + (y2 - y1)^2)
# end

# #分區
# function classify_points(points, coordinates)
#     alist = []
#     blist = []
#     clist = []
#     dlist = []

#     for (x, y) in coordinates
#         dist_to_A = distance(x, y, points[:A]...)
#         dist_to_B = distance(x, y, points[:B]...)
#         dist_to_C = distance(x, y, points[:C]...)
#         dist_to_D = distance(x, y, points[:D]...)
        
#         min_dist, min_point = argmin([dist_to_A, dist_to_B, dist_to_C, dist_to_D]), :A
#         min_dist == 2 && (min_point = :B)
#         min_dist == 3 && (min_point = :C)
#         min_dist == 4 && (min_point = :D)
        
#         if min_point == :A
#             push!(alist, (x, y))
#         elseif min_point == :B
#             push!(blist, (x, y))
#         elseif min_point == :C
#             push!(clist, (x, y))
#         else
#             push!(dlist, (x, y))
#         end
#     end
    
   
#     distances_A = [distance(point[1], point[2], points[:A]...) for point in alist]
#     distances_B = [distance(point[1], point[2], points[:B]...) for point in blist]
#     distances_C = [distance(point[1], point[2], points[:C]...) for point in clist]
#     distances_D = [distance(point[1], point[2], points[:D]...) for point in dlist]

#     distances = sum(distances_A) + sum(distances_B) + sum(distances_C) + sum(distances_D)
#     return  alist, blist, clist, dlist, distances
# end


# #找新點
# function average_point(points_list)
#     x_sum, y_sum = 0, 0
#     for (x, y) in points_list
#         x_sum += x
#         y_sum += y
#     end
    
#     avg_x = x_sum / length(points_list)
#     avg_y = y_sum / length(points_list)
    
#     return avg_x, avg_y
# end

# function new_point(points,alist,blist,clist,dlist)
   
#     avg_A = average_point(alist)
#     avg_B = average_point(blist)
#     avg_C = average_point(clist)
#     avg_D = average_point(dlist)
 
#     points = Dict(:A => avg_A, :B => avg_B, :C => avg_C, :D => avg_D)
#     return points
# end


# points = Dict(:A => (2, 2), :B => (4, 6), :C => (6, 5), :D => (8, 8))

# coordinates = [(2,5),(3,2),(3,3),(3,4),(4,3),(4,4),(6,3),(6,4),
# (6,6),(7,2),(7,5),(7,6),(7,7),(8,6),(8,7)]

# for i in 1:10

#     alist,blist,clist,dlist,distances = classify_points(points, coordinates)
#     global points= new_point(points,alist,blist,clist,dlist)
#     AVG = distances / 15
#     println("AVG: ", AVG)
# end



# using CSV
# using DataFrames
# using Clustering

# # 读取 CSV 文件
# data = CSV.read("C:/Users/JIE/Desktop/dye.csv", DataFrame)

# # 移除 'class' 列
# coordinates = select(data, Not(:class))

# # 执行 k-means 聚类
# result = kmeans(Matrix(coordinates)', 3)

# # 获取聚类结果并将其储存在 cluster3.csv 中
# cluster_labels = result.assignments
# CSV.write("cluster3.csv", DataFrame(cluster = cluster_labels))

# # 将聚类中心作为初始点
# points = Dict(
#     :A => result.centers[1],
#     :B => result.centers[2],
#     :C => result.centers[3]
# )

# # 计算距离的函数
# function distance(point1, point2)
#     return sqrt(sum((point1 .- point2).^2))
# end

# # 分类点的函数
# function classify_points(points, coordinates)
#     alist = []
#     blist = []
#     clist = []

#     for (x, y) in eachrow(coordinates)
#         dist_to_A = distance((x, y), points[:A])
#         dist_to_B = distance((x, y), points[:B])
#         dist_to_C = distance((x, y), points[:C])
        
#         min_dist, min_point = argmin([dist_to_A, dist_to_B, dist_to_C]), :A
#         min_dist == 2 && (min_point = :B)
#         min_dist == 3 && (min_point = :C)
        
#         if min_point == :A
#             push!(alist, (x, y))
#         elseif min_point == :B
#             push!(blist, (x, y))
#         elseif min_point == :C
#             push!(clist, (x, y))
#         end
#     end
    
#     distances_A = [distance(point, points[:A]) for point in alist]
#     distances_B = [distance(point, points[:B]) for point in blist]
#     distances_C = [distance(point, points[:C]) for point in clist]

#     distances = sum(distances_A) + sum(distances_B) + sum(distances_C)
#     return  alist, blist, clist, distances
# end

# # 找到新点的函数
# function average_point(points_list)
#     x_sum, y_sum = 0, 0
#     for (x, y) in points_list
#         x_sum += x
#         y_sum += y
#     end
    
#     avg_x = x_sum / length(points_list)
#     avg_y = y_sum / length(points_list)
    
#     return avg_x, avg_y
# end

# # 更新点的函数
# function new_point(points, alist, blist, clist)
#     avg_A = average_point(alist)
#     avg_B = average_point(blist)
#     avg_C = average_point(clist)
 
#     points = Dict(:A => avg_A, :B => avg_B, :C => avg_C)
#     return points
# end

# # 迭代更新点位置并计算平均距离


# for i in 1:10
#     alist, blist, clist, distances = classify_points(points, coordinates)
#     global points = new_point(points, alist, blist, clist)
#     AVG = distances / size(coordinates, 1)
#     println("AVG: ", AVG)
 
# end

