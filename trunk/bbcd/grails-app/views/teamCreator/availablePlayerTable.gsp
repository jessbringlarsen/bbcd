 <table>
    <thead>
        <tr>
            <th>Navn</th>
            <th>Rating</th>
            <th>Pris</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${playerViewList}" status="i" var="playerView">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${fieldValue(bean:playerView, field:'name')}</td>
            <td>${fieldValue(bean:playerView, field:'rating')}</td>
            <td>${fieldValue(bean:playerView, field:'price')}</td>
            <td><input type="button"
                id="btnBuyPlayer-${playerView.id}"
                value="Køb"
                name="btnBuyPlayer}"
                onclick="javascript: this.disabled=true; buyplayer('${playerView.id}', this);" />
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
<div class="paginateButtons">
    <g:paginate total="${playerViewList.count()}" />
</div>