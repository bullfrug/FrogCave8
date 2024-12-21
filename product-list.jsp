<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            margin: 0;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        img {
            max-width: 50px;
            max-height: 50px;
            border-radius: 5px;
        }
        .actions button {
            padding: 5px 10px;
            margin: 5px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
        }
        .actions button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>Product List</h1>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Image</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}원</td>
            <td><img src="${product.imageUrl}" alt="${product.name}" /></td>
            <td class="actions">
                <form action="/emotioncastle/${category}/addToCartFromWishlist" method="post" style="display: inline;">
                    <input type="hidden" name="product" value="${product.name}" />
                    <button type="submit">Add to Cart</button>
                </form>
                <form action="/emotioncastle/${category}/addToWishlist" method="post" style="display: inline;">
                    <input type="hidden" name="product" value="${product.name}" />
                    <button type="submit">Add to Wishlist</button>
                </form>
                <a href="/emotioncastle/${category}/payment?product=${product.name}">
                    <button type="button">Buy Now</button>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
