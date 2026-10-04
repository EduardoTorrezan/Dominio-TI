# Automação de Ingresso no Domínio (TI)

Este projeto automatiza a adição de computadores a um domínio corporativo (Active Directory), agilizando a configuração inicial de novas máquinas na rede da empresa.

## Como funciona?

O processo é iniciado através de um arquivo Batch que chama o script principal em PowerShell com os privilégios necessários:

1. **`Executar.bat`**: É o arquivo que deve ser executado pelo usuário. Ele é responsável por invocar o script PowerShell (`Entrar-Dominio.ps1`) com o parâmetro `ExecutionPolicy Bypass`. Isso é crucial para ignorar as restrições locais de segurança do Windows que normalmente bloqueariam a execução de scripts não assinados.
2. **`Entrar-Dominio.ps1`**: O script principal que realiza todo o trabalho. Ele interage com o sistema operacional para ingressar a máquina no domínio especificado usando as credenciais fornecidas. Durante o processo, ele solicitará a senha do administrador do domínio para confirmar a operação.

## ⚠️ Configuração Obrigatória

**Antes de usar**, você precisa abrir o arquivo `Entrar-Dominio.ps1` (pode ser no Bloco de Notas ou PowerShell ISE) e alterar as seguintes variáveis de ambiente no código para que reflitam a realidade da sua rede:

```powershell
$Dominio = "SEU_DOMINIO_AQUI.local"  # Ex: "minhaempresa.local"
$Usuario = "SEU_USUARIO_ADMIN"       # Ex: "admin_rede" ou "admin.ti"
```

O script foi limpo para segurança e não contém dados empresariais fixos. **Se você não preencher essas variáveis, o script falhará ao tentar localizar o domínio.**

## Como Usar

1. Baixe os arquivos para o computador local.
2. Edite o arquivo `.ps1` com os dados do seu domínio e usuário (conforme explicado acima) e salve.
3. Dê um duplo-clique no arquivo `Executar.bat`.
4. Quando o prompt aparecer, digite a senha do usuário administrador especificado.
5. O computador será adicionado ao domínio e, em seguida, reiniciado automaticamente (se configurado no script).
