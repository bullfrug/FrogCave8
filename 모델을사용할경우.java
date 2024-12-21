/// 모델 사용시 아래로 바꾸면 됨.



//// 티니핑 의류 페이지
//    @GetMapping("/tinyfing_clothes")
//    public String showClothesPage(Model model) {
//        List<Product> products = productService.getProductsByCategory("clothes");
//        model.addAttribute("products", products);
//        return "teeniepingClothes"; // JSP 파일 이름
//    }
//
//    // 티니핑 굿즈 페이지
//    @GetMapping("/tinyfing_goods")
//    public String showGoodsPage(Model model) {
//        List<Product> products = productService.getProductsByCategory("goods");
//        model.addAttribute("products", products);
//        return "teeniepingGoods"; // JSP 파일 이름
//    }
//
//    // 티니핑 월드 페이지
//    @GetMapping("/tinyfing_world")
//    public String showWorldPage(Model model) {
//        List<Product> products = productService.getProductsByCategory("world");
//        model.addAttribute("products", products);
//        return "teeniepingWorld"; // JSP 파일 이름
//    }
//
//    // 캐치 티니핑 페이지
//    @GetMapping("/catch_tinyfing")
//    public String showCatchTeeniepingPage(Model model) {
//        List<Product> products = productService.getProductsByCategory("catch");
//        model.addAttribute("products", products);
//        return "catchTeenieping"; // JSP 파일 이름
//    }
//}
