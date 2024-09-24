<table border="0" cellpadding="0" cellspacing="0" width="194">
  <tr>
   <td><img src="images/spacer.gif" width="9" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="88" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="88" height="1" border="0" alt=""></td>			   
   <td><img src="images/spacer.gif" width="9" height="1" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="4" height="5"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>					  
  <tr>
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
   <td colspan="2" class="quicklunchtitle">Products Launcher</td>
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
 <tr>
   <td colspan="4" height="5"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>				  
  <tr>
   <td><img src="images/subbox_a.gif" width="9" height="10" border="0" alt=""></td>
   <td bgcolor="#CCCCFF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
   <td bgcolor="#CCCCFF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>			   
   <td><img src="images/subbox_c.gif" width="9" height="10" border="0" alt=""></td>
  </tr>

		<c:set var="NUMBER_OF_COLUMNS" value="2"/>
		<c:set var="NUMBER_OF_ITEMS" value="0"/>
   <c:forEach items="${productgroupings}" var="group" varStatus="counter">

		<c:url var="url" value="product.do" >
			<c:param name="action" value="showAllProductsByGrouping"/>
			<c:param name="groupid" value="${group.id}"/>
		</c:url>							

		<c:set var="NUMBER_OF_ITEMS" value="${counter.count}"/>

		<c:if test="${NUMBER_OF_ITEMS % NUMBER_OF_COLUMNS != 0}">
			<tr>
				<td bgcolor="#CCCCFF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
		</c:if>

		<td align="center" valign="middle" bgcolor="#CCCCFF"><img src="images/product_images_thumbnails/<c:out value='${group.pictureFile}'/>" width="57" height="57" style="border:1px solid #B7B7FF; border-collapse:collapse; margin:0; padding:0; padding:.3em .3em; top; background:#FFFFFF;" alt=""><br><a href="<c:out value="${url}"/>" class="quicklunchlink"><c:out value="${group.name}"/></a></td>
		<c:if test="${NUMBER_OF_ITEMS % NUMBER_OF_COLUMNS == 0}">
			<td bgcolor="#CCCCFF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
		</tr>
		  <tr>
		   <td colspan="4" bgcolor="#CCCCFF" height="15"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
		  </tr>
	  </c:if>
   </c:forEach>
	<!--create blank table cells for the remainder-->
	<c:if test="${(NUMBER_OF_ITEMS % NUMBER_OF_COLUMNS) != 0}">
		<c:set var="remainder" value="${NUMBER_OF_COLUMNS - (NUMBER_OF_ITEMS % NUMBER_OF_COLUMNS)}" scope="request"/>
		
		<!--loop using the remainder variable, print blank spaces-->
		<c:forEach begin="1" end="${remainder}">
			<td bgcolor="#CCCCFF" align="left" valign="top" class="productcont">&nbsp;</td>
		</c:forEach>
			<td bgcolor="#CCCCFF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
		</tr>
		</c:if>				


  <tr>
   <td><img src="images/subbox_g.gif" width="9" height="10" border="0" alt=""></td>
   <td bgcolor="#CCCCFF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
   <td bgcolor="#CCCCFF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>			   
   <td><img src="images/subbox_i.gif" width="9" height="10" border="0" alt=""></td>
  </tr>
<c:if test="${pageName != 'storelistings'}">	  
  <tr>
   <td colspan="4" height="20"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>		
  <tr>
   <td><img src="images/box_stores_a.gif" width="9" height="11" border="0" alt=""></td>
   <td bgcolor="#E9E9FF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
   <td bgcolor="#E9E9FF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>			   
   <td><img src="images/box_stores_c.gif" width="9" height="11" border="0" alt=""></td>
  </tr>	
  <tr>
   <td bgcolor="#E9E9FF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
   <td align="left" valign="top" colspan="2" bgcolor="#E9E9FF" class="boxaboutdesc">
   <span class="storestitle"><a href="storelistings.do" class="storestitle">Store Locations</a></span><br><img src="images/spacer.gif" width="1" height="6" border="0" alt="">
   </td>
   <td bgcolor="#E9E9FF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>			
  <c:forEach items="${storelocations}" var="storelocation" varStatus="counter">  
			 <tr>
			  <td bgcolor="#E9E9FF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
			  <td align="left" valign="top" colspan="2" bgcolor="#E9E9FF" class="boxaboutdesc">
			  <b><c:out value="${storelocation.name}"/></b><br><img src="images/spacer.gif" width="1" height="6" border="0" alt=""><br>
			  <c:out value="${storelocation.address}"/><br><img src="images/spacer.gif" width="1" height="6" border="0" alt=""><br>
			  </td>
			  <td bgcolor="#E9E9FF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
			 </tr>		 
  </c:forEach>  
  <tr>
   <td><img src="images/box_stores_g.gif" width="9" height="11" border="0" alt=""></td>
   <td bgcolor="#E9E9FF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
   <td bgcolor="#E9E9FF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>			   
   <td><img src="images/box_stores_i.gif" width="9" height="11" border="0" alt=""></td>
  </tr>	
</c:if>  
</table>		   