<form action="savesliderimage.do" method="POST" enctype="multipart/form-data" >
	<table style="width: 70%;">
		<input type="hidden" name="sliderImageId" value="${ sliderImage.id }" />
		<input type="hidden" name="action" value="saveSliderImage" />
		
		<c:if test="${ not empty sliderImage.id }">
			<tr><td>Image</td></tr>
			<tr>
				<td colspan="5"><img width="500px" height="300px" src="images/slider/${sliderImage.imageUrl}" /></td>
			</tr>
			
		</c:if>
		<tr>
			<td>Title</td>
			<td><input type="text" name="title" value="${ sliderImage.title }"/></td>
		</tr>
		
		<tr>
			<td>Sort Order</td>
			<td>
				<input type="text" name="sortOrder" value="${ sliderImage.sortOrder }" />
			</td>
		</tr>
		
		<tr>
			<td>Image</td>
			<td><input type="file" name="file" ></td>
		</tr>
		
		<tr>
			<td colspan="2" style="text-align: right;">
				<input type="submit" value="Save" />
			</td>
		</tr>
	</table>
</form>


<script type="text/javascript">

function validate()
{
	
}

</script>