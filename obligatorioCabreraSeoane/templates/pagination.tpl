<!--ul id="paginacion">
    {foreach from=$paginacion item=valor}
        <li>
            <a href="?p={$valor.p}" alt="{$valor.p}" {if $valor.sel} class="sel" {/if}>{$valor.texto}</a>
        </li>
    {/foreach}
</ul-->


<div class="pagination d-flex justify-content-center sticky-top" id="paginacion">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            {foreach from=$paginacion item=valor}
                <li class="page-item">
                    <a id="numeros" class="page-link" href="?p={$valor.p}" alt="{$valor.p}" {if $valor.sel} class="sel" {/if}>{$valor.texto}</a>
                </li>
            {/foreach}
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>
</div>