if (Get-Module -ListAvailable -Name Az) {
    Update-Module -Name Az -Force
} else {
    Install-Module -Name Az -AllowClobber -Force
}

Connect-AzAccount

Get-AZResourcegroup | Select-Object ResourceGroupName, Location

# created RG dave-ai-search-explore-rg

#Setting up AI search bicep github actions project per: https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-github-actions?tabs=CLI%2Cuserlevel
az ad sp create-for-rbac --name  dave-ai-search-exploration --role contributor --scopes /subscriptions/{{sub}}/resourceGroups/ai-search-exploration-rg
