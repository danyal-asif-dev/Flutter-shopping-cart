import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:shpopping_cart_provider_state_management/Cart_Model.dart';
import 'package:shpopping_cart_provider_state_management/Cart_Provider.dart';
import 'package:shpopping_cart_provider_state_management/Data_Base_helper.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

DBHepler? dbHepler = DBHepler();

List<String> ProductName = ['Mango','Orange','Grapes','Banana','Cherry','Peech','Mixed Fruit Bascet'];
List<String> ProductUnit = ['KG','Dozen','KG','Dozen','KG','KG','KG'];
List<int> ProductPrice = [10,20,30,40,50,60,70];
List<String> productImage = [
  'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
  'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
  'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUUlB_d6aRSC5g3qiGDXJBZv4ON1t_z_MMMaKsrlgl5YpEFqZycOMLwHfq&s=10',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtQeAxAbbE7IjN1XLfzvWSPncDvtEzLFdVoX22F28EsF2HIalG7M6TDg&s=10',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReEbc-fYUSG0hU1VP8lkU1vqtwtkLaWPrsW8fFOweqHP_bSOJP5irDH7M&s=10',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2HNEk5XKk-ggPfx2cYFrXQpR-v7OkZw5zpevzO0cyaQ&s',
];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          Center(
            child: Badge(
              badgeContent:  Consumer<CartProvider>(
                builder: (context, value, child) {
                  return Text(
                  value.getcounter().toString(),style: TextStyle(color: Colors.white),);
                },
              ),

              badgeAnimation: BadgeAnimation.slide(
              animationDuration: Duration(seconds: 3),
              ),
              child:   
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
                
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ProductName.length,
              itemBuilder: (context,index){
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image(
                            height: 100,
                            width: 100,
                            image: NetworkImage(productImage[index].toString())),

                            SizedBox(width: 10,),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(ProductName[index].toString(),
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      
                                SizedBox(height: 5),
      
                                 Text(ProductUnit[index].toString() +" " +r"$" + ProductPrice[index].toString() ,
                                 style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      
                                SizedBox(height: 5),
      
                                Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){
                                  dbHepler!.insert(
                                    Cart(
                                    id: index,
                                    ProductId: index.toString(),
                                    ProductName: ProductName[index].toString(),
                                    initialPrice: ProductPrice[index],
                                    ProductPrice: ProductPrice[index],
                                    Quantity: 1,
                                    unitTag: ProductUnit[index].toString(),
                                    image: productImage[index].toString(), ),
                                  ).then((value){
                                    cart.addTotalPrice(double.parse(ProductPrice[index].toString()));
                                    cart.addcounter();
                                    print('Product is added to cart');
                                  
                                  }).onError(((error, stackTrace) {
                                    print(error.toString());
                                  }));
                                },

                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(child: Text('Add to Cart',style: TextStyle(fontSize: 16,color: Colors.black),)) ,
                                
                                  ),
                              ),
                                 ),
                                ],
                              ),
                            ),
                        ],
                      ),

                    ],
                  ), // child column
                );
            })
             ),
        ],
      ), // main column in which the whole code exist
    );
  }
}