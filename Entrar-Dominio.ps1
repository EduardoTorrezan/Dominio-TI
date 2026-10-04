
# ==========================================
# ENTRADA DE COMPUTADOR NO DOMÍNIO
# ==========================================

$Dominio = "inmestra.local"
$Usuario = "INMESTRA\eduardo.torrezan"

Clear-Host

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "       ENTRADA NO DOMÍNIO INMESTRA        " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Solicita o nome do computador
do {
    $NomePC = Read-Host "Digite o nome que a máquina terá"

    if ([string]::IsNullOrWhiteSpace($NomePC)) {
        Write-Host "O nome do computador não pode ficar vazio." -ForegroundColor Red
    }

} while ([string]::IsNullOrWhiteSpace($NomePC))

Write-Host ""
Write-Host "Nome definido: $NomePC" -ForegroundColor Green
Write-Host "Domínio: $Dominio" -ForegroundColor Green
Write-Host ""

# Solicita a senha
$Credencial = Get-Credential -UserName $Usuario -Message "Digite a senha de $Usuario"

try {

    Write-Host "Renomeando computador..." -ForegroundColor Yellow

    Rename-Computer -NewName $NomePC -Force

    Write-Host "Computador renomeado para $NomePC." -ForegroundColor Green

    Write-Host ""
    Write-Host "Entrando no domínio $Dominio..." -ForegroundColor Yellow

    Add-Computer `
        -DomainName $Dominio `
        -Credential $Credencial `
        -Force

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host " COMPUTADOR ADICIONADO AO DOMÍNIO COM OK " -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Nome:    $NomePC"
    Write-Host "Domínio: $Dominio"
    Write-Host ""
    Write-Host "O computador será reiniciado em 10 segundos..."
    
    Start-Sleep -Seconds 10

    Restart-Computer -Force

}
catch {

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Red
    Write-Host "              ERRO NO PROCESSO            " -ForegroundColor Red
    Write-Host "==========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
    Read-Host "Pressione ENTER para sair"
}
```
