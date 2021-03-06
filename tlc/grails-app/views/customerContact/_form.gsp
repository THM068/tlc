<%--
 ~  Copyright 2010-2013 Paul Fernley.
 ~
 ~  This file is part of the Three Ledger Core (TLC) software
 ~  from Paul Fernley.
 ~
 ~  TLC is free software: you can redistribute it and/or modify
 ~  it under the terms of the GNU General Public License as published by
 ~  the Free Software Foundation, either version 3 of the License, or
 ~  (at your option) any later version.
 ~
 ~  TLC is distributed in the hope that it will be useful,
 ~  but WITHOUT ANY WARRANTY; without even the implied warranty of
 ~  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ~  GNU General Public License for more details.
 ~
 ~  You should have received a copy of the GNU General Public License
 ~  along with TLC. If not, see <http://www.gnu.org/licenses/>.
 --%>
<div class="dialog">
    <table>
        <tbody>

        <tr class="prop">
            <td class="name">
                <label for="name"><g:msg code="customerContact.name.label" default="Name"/></label>
            </td>
            <td class="value ${hasErrors(bean:customerContactInstance,field:'name','errors')}">
                <input autofocus="autofocus" type="text" maxlength="50" size="30" id="name" name="name" value="${display(bean:customerContactInstance,field:'name')}"/>&nbsp;<g:help code="customerContact.name"/>
            </td>
        </tr>

        <tr class="prop">
            <td class="name">
                <label for="identifier"><g:msg code="customerContact.identifier.label" default="Identifier"/></label>
            </td>
            <td class="value ${hasErrors(bean:customerContactInstance,field:'identifier','errors')}">
                <input type="text" maxlength="50" size="30" id="identifier" name="identifier" value="${display(bean:customerContactInstance,field:'identifier')}"/>&nbsp;<g:help code="customerContact.identifier"/>
            </td>
        </tr>

        <g:if test="${transferList}">
            <tr class="prop">
                <td class="vtop name">
                    <label for="transfers"><g:msg code="customerContact.usageTransfers.label" default="Transfer Usages"/></label>
                </td>
                <td class="value">
                    <g:domainSelect name="transfers" size="5" options="${transferList}" selected="${customerContactInstance.usageTransfers}" prefix="customerContactType.name" code="code" default="name"/>&nbsp;<g:help code="customerContact.usageTransfers"/>
                </td>
            </tr>
        </g:if>

        </tbody>
    </table>
</div>
