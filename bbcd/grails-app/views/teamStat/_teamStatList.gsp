<div class="list">
    <table>
        <thead>
            <tr>
                <g:sortableColumn property="position" title="Position" />
                <th>Hold</th>
                <g:sortableColumn property="creditStatus" title="Kredit Status" />
            </tr>
        </thead>
        <tbody>
            <g:each in="${teamStatList}" status="i" var="teamStat">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${fieldValue(bean:teamStat, field:'position')}</td>
                    <td>${fieldValue(bean:teamStat, field:'team')}</td>
                    <td>${fieldValue(bean:teamStat, field:'creditStatus')}</td>
                </tr>
            </g:each>
        </tbody>
        </table>
    </div>