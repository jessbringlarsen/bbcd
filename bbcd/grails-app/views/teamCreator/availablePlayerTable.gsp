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
            <td><button id="btnBuyPlayer"
                name="btnBuyPlayer}"
                type="button"
                onclick="javascript: this.disabled=true; buyplayer('${playerView.id}');" >Køb</button>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
<div class="paginateButtons">
    <g:paginate total="${playerViewList.count()}" />
</div>