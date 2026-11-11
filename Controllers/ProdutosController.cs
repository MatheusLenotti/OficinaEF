using Microsoft.AspNetCore.Mvc; 
namespace OficinaEF.Controllers; // Onde está o arquivo

public class ProdutosController : Controller
{
    public IActionResult Index()
{
    return Content("Catálogo de Produtos");

}
}
