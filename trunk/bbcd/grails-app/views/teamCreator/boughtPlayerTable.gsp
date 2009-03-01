<g:if test="${message}">
    <div class="message">${message}</div>
</g:if>
<table>
    <thead>
        <tr>
            <g:sortableColumn property="name" title="Navn" />
            <g:sortableColumn property="clubName" title="Klub" />
            <g:sortableColumn property="className" title="Klasse" />
            <g:sortableColumn property="rating" title="Rating" />
            <g:sortableColumn property="price" title="Pris" />
            <th></th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${playerViewList}" status="i" var="playerView">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
           <td>${fieldValue(bean:playerView, field:'name')}</td>
           <td>${fieldValue(bean:playerView, field:'clubName')}</td>
           <td>${fieldValue(bean:playerView, field:'className')}</td>
           <td>${fieldValue(bean:playerView, field:'rating')}</td>
           <td>${fieldValue(bean:playerView, field:'price')}</td>
           <td><input type="button"
                    id="btnSellPlayer-${playerView.id}"
                    value="Sælg"
                    name="btnSellPlayer-${playerView.id}"
                    onclick="javascript: this.disabled=true; sellplayer(${playerView.id});" /></td>
            </tr>
    </g:each>
    </tbody>
</table>
