[33mcommit d33bf24e4725f3685e3270bf71bf5b637fa04e0d[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmaster[m[33m)[m
Author: NathanDecatur <NateD712@gmail.com>
Date:   Sun Nov 3 12:06:49 2024 -0500

    Added CRUD operations for all tables along with HTTP function handles in main

[1mdiff --git a/README.md b/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..6d8ceb6[m
[1m--- /dev/null[m
[1m+++ b/README.md[m
[36m@@ -0,0 +1,13 @@[m
[32m+[m[32m### Installing necessary packages:[m[41m  [m
[32m+[m[32m* `pip install fastapi`[m
[32m+[m[32m* `pip install "uvicorn[standard]"`[m[41m  [m
[32m+[m[32m* `pip install sqlalchemy`[m[41m  [m
[32m+[m[32m* `pip install pymysql`[m
[32m+[m[32m* `pip install pytest`[m
[32m+[m[32m* `pip install pytest-mock`[m
[32m+[m[32m* `pip install httpx`[m
[32m+[m[32m* `pip install cryptography`[m
[32m+[m[32m### Run the server:[m
[32m+[m[32m`uvicorn api.main:app --reload`[m
[32m+[m[32m### Test API by built-in docs:[m
[32m+[m[32m[http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)[m
\ No newline at end of file[m
[1mdiff --git a/__init__.py b/__init__.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/api/__init__.py b/api/__init__.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/api/__pycache__/__init__.cpython-312.pyc b/api/__pycache__/__init__.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..565322e[m
Binary files /dev/null and b/api/__pycache__/__init__.cpython-312.pyc differ
[1mdiff --git a/api/__pycache__/main.cpython-312.pyc b/api/__pycache__/main.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..b2695ea[m
Binary files /dev/null and b/api/__pycache__/main.cpython-312.pyc differ
[1mdiff --git a/api/controllers/__init__.py b/api/controllers/__init__.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/api/controllers/__pycache__/__init__.cpython-312.pyc b/api/controllers/__pycache__/__init__.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..d684203[m
Binary files /dev/null and b/api/controllers/__pycache__/__init__.cpython-312.pyc differ
[1mdiff --git a/api/controllers/__pycache__/order_details.cpython-312.pyc b/api/controllers/__pycache__/order_details.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..fa2262d[m
Binary files /dev/null and b/api/controllers/__pycache__/order_details.cpython-312.pyc differ
[1mdiff --git a/api/controllers/__pycache__/orders.cpython-312.pyc b/api/controllers/__pycache__/orders.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..76b72db[m
Binary files /dev/null and b/api/controllers/__pycache__/orders.cpython-312.pyc differ
[1mdiff --git a/api/controllers/__pycache__/recipes.cpython-312.pyc b/api/controllers/__pycache__/recipes.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..57163af[m
Binary files /dev/null and b/api/controllers/__pycache__/recipes.cpython-312.pyc differ
[1mdiff --git a/api/controllers/__pycache__/resources.cpython-312.pyc b/api/controllers/__pycache__/resources.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..ffac303[m
Binary files /dev/null and b/api/controllers/__pycache__/resources.cpython-312.pyc differ
[1mdiff --git a/api/controllers/__pycache__/sandwiches.cpython-312.pyc b/api/controllers/__pycache__/sandwiches.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..bbc49bc[m
Binary files /dev/null and b/api/controllers/__pycache__/sandwiches.cpython-312.pyc differ
[1mdiff --git a/api/controllers/order_details.py b/api/controllers/order_details.py[m
[1mnew file mode 100644[m
[1mindex 0000000..18fd8a5[m
[1m--- /dev/null[m
[1m+++ b/api/controllers/order_details.py[m
[36m@@ -0,0 +1,52 @@[m
[32m+[m[32mfrom sqlalchemy.orm import Session[m
[32m+[m[32mfrom fastapi import HTTPException, status, Response, Depends[m
[32m+[m[32mfrom ..models import models, schemas[m
[32m+[m
[32m+[m
[32m+[m[32mdef create(db: Session, order_detail):[m
[32m+[m[32m    # Create a new instance of the order_detail model with the provided data[m
[32m+[m[32m    db_order_detail = models.OrderDetail([m
[32m+[m[32m        amount=order_detail.get('amount'),[m
[32m+[m
[32m+[m
[32m+[m[32m    )[m
[32m+[m[32m    # Add the newly created order_detail object to the database session[m
[32m+[m[32m    db.add(db_order_detail)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Refresh the order_detail object to ensure it reflects the current state in the database[m
[32m+[m[32m    db.refresh(db_order_detail)[m
[32m+[m[32m    # Return the newly created order_detail object[m
[32m+[m[32m    return db_order_detail[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_all(db: Session):[m
[32m+[m[32m    return db.query(models.OrderDetail).all()[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_one(db: Session, order_detail_id):[m
[32m+[m[32m    return db.query(models.OrderDetail).filter(models.OrderDetail.id == order_detail_id).first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef update(db: Session, order_detail_id, order_detail):[m
[32m+[m[32m    # Query the database for the specific order_detail to update[m
[32m+[m[32m    db_order_detail = db.query(models.OrderDetail).filter(models.OrderDetail.id == order_detail_id)[m
[32m+[m[32m    # Extract the update data from the provided 'order_detail' object[m
[32m+[m[32m    update_data = order_detail.model_dump(exclude_unset=True)[m
[32m+[m[32m    # Update the database record with the new data, without synchronizing the session[m
[32m+[m[32m    db_order_detail.update(update_data, synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return the updated order_detail record[m
[32m+[m[32m    return db_order_detail.first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef delete(db: Session, order_detail_id):[m
[32m+[m[32m    # Query the database for the specific order_detail to delete[m
[32m+[m[32m    db_order_detail = db.query(models.OrderDetail).filter(models.OrderDetail.id == order_detail_id)[m
[32m+[m[32m    # Delete the database record without synchronizing the session[m
[32m+[m[32m    db_order_detail.delete(synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return a response with a status code indicating success (204 No Content)[m
[32m+[m[32m    return Response(status_code=status.HTTP_204_NO_CONTENT)[m
[1mdiff --git a/api/controllers/orders.py b/api/controllers/orders.py[m
[1mnew file mode 100644[m
[1mindex 0000000..ff44d02[m
[1m--- /dev/null[m
[1m+++ b/api/controllers/orders.py[m
[36m@@ -0,0 +1,51 @@[m
[32m+[m[32mfrom sqlalchemy.orm import Session[m
[32m+[m[32mfrom fastapi import HTTPException, status, Response, Depends[m
[32m+[m[32mfrom ..models import models, schemas[m
[32m+[m
[32m+[m
[32m+[m[32mdef create(db: Session, order):[m
[32m+[m[32m    # Create a new instance of the Order model with the provided data[m
[32m+[m[32m    db_order = models.Order([m
[32m+[m[32m        customer_name=order.customer_name,[m
[32m+[m[32m        description=order.description[m
[32m+[m[32m    )[m
[32m+[m[32m    # Add the newly created Order object to the database session[m
[32m+[m[32m    db.add(db_order)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Refresh the Order object to ensure it reflects the current state in the database[m
[32m+[m[32m    db.refresh(db_order)[m
[32m+[m[32m    # Return the newly created Order object[m
[32m+[m[32m    return db_order[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_all(db: Session):[m
[32m+[m[32m    return db.query(models.Order).all()[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_one(db: Session, order_id):[m
[32m+[m[32m    return db.query(models.Order).filter(models.Order.id == order_id).first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef update(db: Session, order_id, order):[m
[32m+[m[32m    # Query the database for the specific order to update[m
[32m+[m[32m    db_order = db.query(models.Order).filter(models.Order.id == order_id)[m
[32m+[m[32m    # Extract the update data from the provided 'order' object[m
[32m+[m[32m    update_data = order.model_dump(exclude_unset=True)[m
[32m+[m[32m    # Update the database record with the new data, without synchronizing the session[m
[32m+[m[32m    db_order.update(update_data, synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return the updated order record[m
[32m+[m[32m    return db_order.first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef delete(db: Session, order_id):[m
[32m+[m[32m    # Query the database for the specific order to delete[m
[32m+[m[32m    db_order = db.query(models.Order).filter(models.Order.id == order_id)[m
[32m+[m[32m    # Delete the database record without synchronizing the session[m
[32m+[m[32m    db_order.delete(synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return a response with a status code indicating success (204 No Content)[m
[32m+[m[32m    return Response(status_code=status.HTTP_204_NO_CONTENT)[m
[1mdiff --git a/api/controllers/recipes.py b/api/controllers/recipes.py[m
[1mnew file mode 100644[m
[1mindex 0000000..4eb41e7[m
[1m--- /dev/null[m
[1m+++ b/api/controllers/recipes.py[m
[36m@@ -0,0 +1,50 @@[m
[32m+[m[32mfrom sqlalchemy.orm import Session[m
[32m+[m[32mfrom fastapi import HTTPException, status, Response, Depends[m
[32m+[m[32mfrom ..models import models, schemas[m
[32m+[m
[32m+[m
[32m+[m[32mdef create(db: Session, recipe):[m
[32m+[m[32m    # Create a new instance of the recipe model with the provided data[m
[32m+[m[32m    db_recipe = models.Recipe([m
[32m+[m[32m        amount = recipe.amount[m
[32m+[m[32m    )[m
[32m+[m[32m    # Add the newly created recipe object to the database session[m
[32m+[m[32m    db.add(db_recipe)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Refresh the recipe object to ensure it reflects the current state in the database[m
[32m+[m[32m    db.refresh(db_recipe)[m
[32m+[m[32m    # Return the newly created recipe object[m
[32m+[m[32m    return db_recipe[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_all(db: Session):[m
[32m+[m[32m    return db.query(models.Recipe).all()[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_one(db: Session, recipe_id):[m
[32m+[m[32m    return db.query(models.Recipe).filter(models.Recipe.id == recipe_id).first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef update(db: Session, recipe_id, recipe):[m
[32m+[m[32m    # Query the database for the specific recipe to update[m
[32m+[m[32m    db_recipe = db.query(models.Recipe).filter(models.Recipe.id == recipe_id)[m
[32m+[m[32m    # Extract the update data from the provided 'recipe' object[m
[32m+[m[32m    update_data = recipe.model_dump(exclude_unset=True)[m
[32m+[m[32m    # Update the database record with the new data, without synchronizing the session[m
[32m+[m[32m    db_recipe.update(update_data, synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return the updated recipe record[m
[32m+[m[32m    return db_recipe.first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef delete(db: Session, recipe_id):[m
[32m+[m[32m    # Query the database for the specific recipe to delete[m
[32m+[m[32m    db_recipe = db.query(models.Recipe).filter(models.Recipe.id == recipe_id)[m
[32m+[m[32m    # Delete the database record without synchronizing the session[m
[32m+[m[32m    db_recipe.delete(synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return a response with a status code indicating success (204 No Content)[m
[32m+[m[32m    return Response(status_code=status.HTTP_204_NO_CONTENT)[m
[1mdiff --git a/api/controllers/resources.py b/api/controllers/resources.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e4bf8a9[m
[1m--- /dev/null[m
[1m+++ b/api/controllers/resources.py[m
[36m@@ -0,0 +1,51 @@[m
[32m+[m[32mfrom sqlalchemy.orm import Session[m
[32m+[m[32mfrom fastapi import HTTPException, status, Response, Depends[m
[32m+[m[32mfrom ..models import models, schemas[m
[32m+[m
[32m+[m
[32m+[m[32mdef create(db: Session, resource):[m
[32m+[m[32m    # Create a new instance of the resource model with the provided data[m
[32m+[m[32m    db_resource = models.Resource([m
[32m+[m[32m        item=resource.item,[m
[32m+[m[32m        amount=resource.amount[m
[32m+[m[32m    )[m
[32m+[m[32m    # Add the newly created resource object to the database session[m
[32m+[m[32m    db.add(db_resource)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Refresh the resource object to ensure it reflects the current state in the database[m
[32m+[m[32m    db.refresh(db_resource)[m
[32m+[m[32m    # Return the newly created resource object[m
[32m+[m[32m    return db_resource[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_all(db: Session):[m
[32m+[m[32m    return db.query(models.Resource).all()[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_one(db: Session, resource_id):[m
[32m+[m[32m    return db.query(models.Resource).filter(models.Resource.id == resource_id).first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef update(db: Session, resource_id, resource):[m
[32m+[m[32m    # Query the database for the specific resource to update[m
[32m+[m[32m    db_resource = db.query(models.Resource).filter(models.Resource.id == resource_id)[m
[32m+[m[32m    # Extract the update data from the provided 'resource' object[m
[32m+[m[32m    update_data = resource.model_dump(exclude_unset=True)[m
[32m+[m[32m    # Update the database record with the new data, without synchronizing the session[m
[32m+[m[32m    db_resource.update(update_data, synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return the updated resource record[m
[32m+[m[32m    return db_resource.first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef delete(db: Session, resource_id):[m
[32m+[m[32m    # Query the database for the specific resource to delete[m
[32m+[m[32m    db_resource = db.query(models.Resource).filter(models.Resource.id == resource_id)[m
[32m+[m[32m    # Delete the database record without synchronizing the session[m
[32m+[m[32m    db_resource.delete(synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return a response with a status code indicating success (204 No Content)[m
[32m+[m[32m    return Response(status_code=status.HTTP_204_NO_CONTENT)[m
\ No newline at end of file[m
[1mdiff --git a/api/controllers/sandwiches.py b/api/controllers/sandwiches.py[m
[1mnew file mode 100644[m
[1mindex 0000000..ca19051[m
[1m--- /dev/null[m
[1m+++ b/api/controllers/sandwiches.py[m
[36m@@ -0,0 +1,51 @@[m
[32m+[m[32mfrom sqlalchemy.orm import Session[m
[32m+[m[32mfrom fastapi import HTTPException, status, Response, Depends[m
[32m+[m[32mfrom ..models import models, schemas[m
[32m+[m
[32m+[m
[32m+[m[32mdef create(db: Session, sandwich):[m
[32m+[m[32m    # Create a new instance of the sandwich model with the provided data[m
[32m+[m[32m    db_sandwich = models.Sandwich([m
[32m+[m[32m        sandwich_name=sandwich.sandwich_name,[m
[32m+[m[32m        price=sandwich.price[m
[32m+[m[32m    )[m
[32m+[m[32m    # Add the newly created sandwich object to the database session[m
[32m+[m[32m    db.add(db_sandwich)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Refresh the sandwich object to ensure it reflects the current state in the database[m
[32m+[m[32m    db.refresh(db_sandwich)[m
[32m+[m[32m    # Return the newly created sandwich object[m
[32m+[m[32m    return db_sandwich[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_all(db: Session):[m
[32m+[m[32m    return db.query(models.Sandwich).all()[m
[32m+[m
[32m+[m
[32m+[m[32mdef read_one(db: Session, sandwich_id):[m
[32m+[m[32m    return db.query(models.Sandwich).filter(models.Sandwich.id == sandwich_id).first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef update(db: Session, sandwich_id, sandwich):[m
[32m+[m[32m    # Query the database for the specific sandwich to update[m
[32m+[m[32m    db_sandwich = db.query(models.Sandwich).filter(models.Sandwich.id == sandwich_id)[m
[32m+[m[32m    # Extract the update data from the provided 'sandwich' object[m
[32m+[m[32m    update_data = sandwich.model_dump(exclude_unset=True)[m
[32m+[m[32m    # Update the database record with the new data, without synchronizing the session[m
[32m+[m[32m    db_sandwich.update(update_data, synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return the updated sandwich record[m
[32m+[m[32m    return db_sandwich.first()[m
[32m+[m
[32m+[m
[32m+[m[32mdef delete(db: Session, sandwich_id):[m
[32m+[m[32m    # Query the database for the specific sandwich to delete[m
[32m+[m[32m    db_sandwich = db.query(models.Sandwich).filter(models.Sandwich.id == sandwich_id)[m
[32m+[m[32m    # Delete the database record without synchronizing the session[m
[32m+[m[32m    db_sandwich.delete(synchronize_session=False)[m
[32m+[m[32m    # Commit the changes to the database[m
[32m+[m[32m    db.commit()[m
[32m+[m[32m    # Return a response with a status code indicating success (204 No Content)[m
[32m+[m[32m    return Response(status_code=status.HTTP_204_NO_CONTENT)[m
\ No newline at end of file[m
[1mdiff --git a/api/dependencies/__init__.py b/api/dependencies/__init__.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/api/dependencies/__pycache__/__init__.cpython-312.pyc b/api/dependencies/__pycache__/__init__.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..7b4948c[m
Binary files /dev/null and b/api/dependencies/__pycache__/__init__.cpython-312.pyc differ
[1mdiff --git a/api/dependencies/__pycache__/config.cpython-312.pyc b/api/dependencies/__pycache__/config.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..497ae17[m
Binary files /dev/null and b/api/dependencies/__pycache__/config.cpython-312.pyc differ
[1mdiff --git a/api/dependencies/__pycache__/database.cpython-312.pyc b/api/dependencies/__pycache__/database.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..0cf8fc1[m
Binary files /dev/null and b/api/dependencies/__pycache__/database.cpython-312.pyc differ
[1mdiff --git a/api/dependencies/config.py b/api/dependencies/config.py[m
[1mnew file mode 100644[m
[1mindex 0000000..96d60aa[m
[1m--- /dev/null[m
[1m+++ b/api/dependencies/config.py[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32mclass conf:[m
[32m+[m[32m    host = "localhost"[m
[32m+[m[32m    database = "sandwich_maker_api"[m
[32m+[m[32m    port = 3306[m
[32m+[m[32m    user = "root"[m
[32m+[m[32m    password = "0712"[m
\ No newline at end of file[m
[1mdiff --git a/api/dependencies/database.py b/api/dependencies/database.py[m
[1mnew file mode 100644[m
[1mindex 0000000..25fbccd[m
[1m--- /dev/null[m
[1m+++ b/api/dependencies/database.py[m
[36m@@ -0,0 +1,23 @@[m
[32m+[m[32mfrom sqlalchemy import create_engine[m
[32m+[m[32m# from sqlalchemy.ext.declarative import declarative_base[m
[32m+[m[32mfrom sqlalchemy.orm import sessionmaker, declarative_base[m
[32m+[m[32mfrom .config import conf[m
[32m+[m[32mfrom urllib.parse import quote_plus[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32mSQLALCHEMY_DATABASE_URL = f"mysql+pymysql://{conf.user}:{quote_plus(conf.password)}@{conf.host}:{conf.port}/{conf.database}?charset=utf8mb4"[m
[32m+[m[32mengine = create_engine([m
[32m+[m[32m    SQLALCHEMY_DATABASE_URL[m
[32m+[m[32m)[m
[32m+[m[32mSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)[m
[32m+[m
[32m+[m[32mBase = declarative_base()[m
[32m+[m
[32m+[m
[32m+[m[32mdef get_db():[m
[32m+[m[32m    db = SessionLocal()[m
[32m+[m[32m    try:[m
[32m+[m[32m        yield db[m
[32m+[m[32m    finally:[m
[32m+[m[32m        db.close()[m
\ No newline at end of file[m
[1mdiff --git a/api/main.py b/api/main.py[m
[1mnew file mode 100644[m
[1mindex 0000000..b2aaa82[m
[1m--- /dev/null[m
[1m+++ b/api/main.py[m
[36m@@ -0,0 +1,193 @@[m
[32m+[m[32mfrom fastapi import Depends, FastAPI, HTTPException[m
[32m+[m[32mfrom sqlalchemy.orm import Session[m
[32m+[m[32mfrom fastapi.middleware.cors import CORSMiddleware[m
[32m+[m
[32m+[m[32mfrom .models import models, schemas[m
[32m+[m[32mfrom .controllers import orders, sandwiches, resources, recipes, order_details[m
[32m+[m[32mfrom .dependencies.database import engine, get_db[m
[32m+[m
[32m+[m[32mmodels.Base.metadata.create_all(bind=engine)[m
[32m+[m
[32m+[m[32mapp = FastAPI()[m
[32m+[m
[32m+[m[32morigins = ["*"][m
[32m+[m
[32m+[m[32mapp.add_middleware([m
[32m+[m[32m    CORSMiddleware,[m
[32m+[m[32m    allow_origins=origins,[m
[32m+[m[32m    allow_credentials=True,[m
[32m+[m[32m    allow_methods=["*"],[m
[32m+[m[32m    allow_headers=["*"],[m
[32m+[m[32m)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.post("/orders/", response_model=schemas.Order, tags=["Orders"])[m
[32m+[m[32mdef create_order(order: schemas.OrderCreate, db: Session = Depends(get_db)):[m
[32m+[m[32m    return orders.create(db=db, order=order)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.get("/orders/", response_model=list[schemas.Order], tags=["Orders"])[m
[32m+[m[32mdef read_orders(db: Session = Depends(get_db)):[m
[32m+[m[32m    return orders.read_all(db)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.get("/orders/{order_id}", response_model=schemas.Order, tags=["Orders"])[m
[32m+[m[32mdef read_one_order(order_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    order = orders.read_one(db, order_id=order_id)[m
[32m+[m[32m    if order is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return order[m
[32m+[m
[32m+[m
[32m+[m[32m@app.put("/orders/{order_id}", response_model=schemas.Order, tags=["Orders"])[m
[32m+[m[32mdef update_one_order(order_id: int, order: schemas.OrderUpdate, db: Session = Depends(get_db)):[m
[32m+[m[32m    order_db = orders.read_one(db, order_id=order_id)[m
[32m+[m[32m    if order_db is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return orders.update(db=db, order=order, order_id=order_id)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.delete("/orders/{order_id}", tags=["Orders"])[m
[32m+[m[32mdef delete_one_order(order_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    order = orders.read_one(db, order_id=order_id)[m
[32m+[m[32m    if order is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return orders.delete(db=db, order_id=order_id)[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m@app.post("/sandwiches/", response_model=schemas.Sandwich, tags=["Sandwiches"])[m
[32m+[m[32mdef create_sandwich(sandwich: schemas.SandwichCreate, db: Session = Depends(get_db)):[m
[32m+[m[32m    return sandwiches.create(db=db, sandwich=sandwich)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.get("/sandwiches/", response_model=list[schemas.Sandwich], tags=["Sandwiches"])[m
[32m+[m[32mdef read_sandwiches(db: Session = Depends(get_db)):[m
[32m+[m[32m    return sandwiches.read_all(db)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.get("/sandwiches/{sandwich_id}", response_model=schemas.Sandwich, tags=["Sandwiches"])[m
[32m+[m[32mdef read_one_sandwich(sandwich_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    sandwich = sandwiches.read_one(db, sandwich_id=sandwich_id)[m
[32m+[m[32m    if sandwich is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return sandwich[m
[32m+[m
[32m+[m
[32m+[m[32m@app.put("/sandwiches/{sandwich_id}", response_model=schemas.Sandwich, tags=["Sandwiches"])[m
[32m+[m[32mdef update_one_sandwich(sandwich_id: int, sandwich: schemas.SandwichUpdate, db: Session = Depends(get_db)):[m
[32m+[m[32m    sandwich_db = sandwiches.read_one(db, sandwich_id=sandwich_id)[m
[32m+[m[32m    if sandwich_db is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return sandwiches.update(db=db, sandwich=sandwich, sandwich_id=sandwich_id)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.delete("/sandwiches/{sandwich_id}", tags=["Sandwiches"])[m
[32m+[m[32mdef delete_one_sandwich(sandwich_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    sandwich = sandwiches.read_one(db, sandwich_id=sandwich_id)[m
[32m+[m[32m    if sandwich is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return sandwiches.delete(db=db, sandwich_id=sandwich_id)[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m@app.post("/resources/", response_model=schemas.Resource, tags=["Resources"])[m
[32m+[m[32mdef create_resource(resource: schemas.ResourceCreate, db: Session = Depends(get_db)):[m
[32m+[m[32m    return resources.create(db=db, resource=resource)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.get("/resources/", response_model=list[schemas.Resource], tags=["Resources"])[m
[32m+[m[32mdef read_resources(db: Session = Depends(get_db)):[m
[32m+[m[32m    return resources.read_all(db)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.get("/resources/{resource_id}", response_model=schemas.Resource, tags=["Resources"])[m
[32m+[m[32mdef read_one_resource(resource_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    resource = resources.read_one(db, resource_id=resource_id)[m
[32m+[m[32m    if resource is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return resource[m
[32m+[m
[32m+[m
[32m+[m[32m@app.put("/resources/{resource_id}", response_model=schemas.Resource, tags=["Resources"])[m
[32m+[m[32mdef update_one_resource(resource_id: int, resource: schemas.ResourceUpdate, db: Session = Depends(get_db)):[m
[32m+[m[32m    resource_db = resources.read_one(db, resource_id=resource_id)[m
[32m+[m[32m    if resource_db is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return resources.update(db=db, resource=resource, resource_id=resource_id)[m
[32m+[m
[32m+[m
[32m+[m[32m@app.delete("/resources/{resource_id}", tags=["Resources"])[m
[32m+[m[32mdef delete_one_resource(resource_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    resource = resources.read_one(db, resource_id=resource_id)[m
[32m+[m[32m    if resource is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return resources.delete(db=db, resource_id=resource_id)[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m@app.post("/order_details/", response_model=schemas.OrderDetail, tags=["Order_Details"])[m
[32m+[m[32mdef create_order_detail(order_detail: schemas.OrderDetailCreate, db: Session = Depends(get_db)):[m
[32m+[m[32m    return order_details.create(db=db, order_detail=order_detail)[m
[32m+[m
[32m+[m[32m@app.get("/order_details/", response_model=list[schemas.OrderDetail], tags=["Order_Details"])[m
[32m+[m[32mdef read_order_details(db: Session = Depends(get_db)):[m
[32m+[m[32m    return order_details.read_all(db)[m
[32m+[m
[32m+[m[32m@app.get("/order_details/{order_detail_id}", response_model=schemas.OrderDetail, tags=["Order_Details"])[m
[32m+[m[32mdef read_one_order_detail(order_detail_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    order_detail = order_details.read_one(db, order_detail_id=order_detail_id)[m
[32m+[m[32m    if order_detail is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return order_detail[m
[32m+[m
[32m+[m[32m@app.put("/order_details/{order_detail_id}", response_model=schemas.OrderDetail, tags=["Order_Details"])[m
[32m+[m[32mdef update_one_order_detail(order_detail_id: int, order_detail: schemas.OrderDetail, db: Session = Depends(get_db)):[m
[32m+[m[32m    order_detail_db = order_details.read_one(db, order_detail_id=order_detail_id)[m
[32m+[m[32m    if order_detail_db is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return order_details.update(db=db, order_detail=order_detail, order_detail_id=order_detail_id)[m
[32m+[m
[32m+[m[32m@app.delete("/order_details/{order_detail_id}", tags=["Order_Details"])[m
[32m+[m[32mdef delete_one_order_detail(order_detail_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    order_detail = order_details.read_one(db, order_detail_id=order_detail_id)[m
[32m+[m[32m    if order_detail is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return order_details.delete(db=db, order_detail_id=order_detail_id)[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m@app.post("/recipes/", response_model=schemas.Recipe, tags=["Recipes"])[m
[32m+[m[32mdef create_recipe(recipe: schemas.RecipeCreate, db: Session = Depends(get_db)):[m
[32m+[m[32m    return recipes.create(db=db, recipe=recipe)[m
[32m+[m
[32m+[m[32m@app.get("/recipes/", response_model=list[schemas.Recipe], tags=["Recipes"])[m
[32m+[m[32mdef read_recipes(db: Session = Depends(get_db)):[m
[32m+[m[32m    return recipes.read_all(db)[m
[32m+[m
[32m+[m[32m@app.get("/recipes/{recipe_id}", response_model=schemas.Recipe, tags=["Recipes"])[m
[32m+[m[32mdef read_one_recipe(recipe_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    recipe = recipes.read_one(db, recipe_id=recipe_id)[m
[32m+[m[32m    if recipe is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return recipe[m
[32m+[m
[32m+[m[32m@app.put("/recipes/{recipe_id}", response_model=schemas.Recipe, tags=["Recipes"])[m
[32m+[m[32mdef update_one_recipe(recipe_id: int, recipe: schemas.RecipeUpdate, db: Session = Depends(get_db)):[m
[32m+[m[32m    recipe_db = recipes.read_one(db, recipe_id=recipe_id)[m
[32m+[m[32m    if recipe_db is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return recipes.update(db=db, recipe=recipe, recipe_id=recipe_id)[m
[32m+[m
[32m+[m[32m@app.delete("/recipes/{recipe_id}", tags=["Recipes"])[m
[32m+[m[32mdef delete_one_recipe(recipe_id: int, db: Session = Depends(get_db)):[m
[32m+[m[32m    recipe = recipes.read_one(db, recipe_id=recipe_id)[m
[32m+[m[32m    if recipe is None:[m
[32m+[m[32m        raise HTTPException(status_code=404, detail="User not found")[m
[32m+[m[32m    return recipes.delete(db=db, recipe_id=recipe_id)[m
[32m+[m
[32m+[m
[1mdiff --git a/api/models/__init__.py b/api/models/__init__.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/api/models/__pycache__/__init__.cpython-312.pyc b/api/models/__pycache__/__init__.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..b57be2f[m
Binary files /dev/null and b/api/models/__pycache__/__init__.cpython-312.pyc differ
[1mdiff --git a/api/models/__pycache__/models.cpython-312.pyc b/api/models/__pycache__/models.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..aec12cf[m
Binary files /dev/null and b/api/models/__pycache__/models.cpython-312.pyc differ
[1mdiff --git a/api/models/__pycache__/schemas.cpython-312.pyc b/api/models/__pycache__/schemas.cpython-312.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..2dd3078[m
Binary files /dev/null and b/api/models/__pycache__/schemas.cpython-312.pyc differ
[1mdiff --git a/api/models/models.py b/api/models/models.py[m
[1mnew file mode 100644[m
[1mindex 0000000..5c2bf59[m
[1m--- /dev/null[m
[1m+++ b/api/models/models.py[m
[36m@@ -0,0 +1,60 @@[m
[32m+[m[32mfrom sqlalchemy import Column, ForeignKey, Integer, String, DECIMAL, DATETIME[m
[32m+[m[32mfrom sqlalchemy.orm import relationship[m
[32m+[m[32mfrom datetime import datetime[m
[32m+[m[32mfrom ..dependencies.database import Base[m
[32m+[m
[32m+[m
[32m+[m[32mclass Sandwich(Base):[m
[32m+[m[32m    __tablename__ = "sandwiches"[m
[32m+[m
[32m+[m[32m    id = Column(Integer, primary_key=True, index=True, autoincrement=True)[m
[32m+[m[32m    sandwich_name = Column(String(100), unique=True, nullable=True)[m
[32m+[m[32m    price = Column(DECIMAL(4, 2), nullable=False, server_default='0.0')[m
[32m+[m
[32m+[m[32m    recipes = relationship("Recipe", back_populates="sandwich")[m
[32m+[m[32m    order_details = relationship("OrderDetail", back_populates="sandwich")[m
[32m+[m
[32m+[m
[32m+[m[32mclass Resource(Base):[m
[32m+[m[32m    __tablename__ = "resources"[m
[32m+[m
[32m+[m[32m    id = Column(Integer, primary_key=True, index=True, autoincrement=True)[m
[32m+[m[32m    item = Column(String(100), unique=True, nullable=False)[m
[32m+[m[32m    amount = Column(Integer, index=True, nullable=False, server_default='0.0')[m
[32m+[m
[32m+[m[32m    recipes = relationship("Recipe", back_populates="resource")[m
[32m+[m
[32m+[m
[32m+[m[32mclass Recipe(Base):[m
[32m+[m[32m    __tablename__ = "recipes"[m
[32m+[m
[32m+[m[32m    id = Column(Integer, primary_key=True, index=True, autoincrement=True)[m
[32m+[m[32m    sandwich_id = Column(Integer, ForeignKey("sandwiches.id"))[m
[32m+[m[32m    resource_id = Column(Integer, ForeignKey("resources.id"))[m
[32m+[m[32m    amount = Column(Integer, index=True, nullable=False, server_default='0.0')[m
[32m+[m
[32m+[m[32m    sandwich = relationship("Sandwich", back_populates="recipes")[m
[32m+[m[32m    resource = relationship("Resource", back_populates="recipes")[m
[32m+[m
[32m+[m
[32m+[m[32mclass Order(Base):[m
[32m+[m[32m    __tablename__ = "orders"[m
[32m+[m
[32m+[m[32m    id = Column(Integer, primary_key=True, index=True, autoincrement=True)[m
[32m+[m[32m    customer_name = Column(String(100))[m
[32m+[m[32m    order_date = Column(DATETIME, nullable=False, server_default=str(datetime.now()))[m
[32m+[m[32m    description = Column(String(300))[m
[32m+[m
[32m+[m[32m    order_details = relationship("OrderDetail", back_populates="order")[m
[32m+[m
[32m+[m
[32m+[m[32mclass OrderDetail(Base):[m
[32m+[m[32m    __tablename__ = "order_details"[m
[32m+[m
[32m+[m[32m    id = Column(Integer, primary_key=True, index=True, autoincrement=True)[m
[32m+[m[32m    order_id = Column(Integer, ForeignKey("orders.id"))[m
[32m+[m[32m    sandwich_id = Column(Integer, ForeignKey("sandwiches.id"))[m
[32m+[m[32m    amount = Column(Integer, index=True, nullable=False)[m
[32m+[m
[32m+[m[32m    sandwich = relationship("Sandwich", back_populates="order_details")[m
[32m+[m[32m    order = relationship("Order", back_populates="order_details")[m
[1mdiff --git a/api/models/schemas.py b/api/models/schemas.py[m
[1mnew file mode 100644[m
[1mindex 0000000..bf0a19f[m
[1m--- /dev/null[m
[1m+++ b/api/models/schemas.py[m
[36m@@ -0,0 +1,113 @@[m
[32m+[m[32mfrom datetime import datetime[m
[32m+[m[32mfrom typing import Optional[m
[32m+[m[32mfrom pydantic import BaseModel[m
[32m+[m
[32m+[m
[32m+[m[32mclass SandwichBase(BaseModel):[m
[32m+[m[32m    sandwich_name: str[m
[32m+[m[32m    price: float[m
[32m+[m
[32m+[m
[32m+[m[32mclass SandwichCreate(SandwichBase):[m
[32m+[m[32m    pass[m
[32m+[m
[32m+[m
[32m+[m[32mclass SandwichUpdate(BaseModel):[m
[32m+[m[32m    sandwich_name: Optional[str] = None[m
[32m+[m[32m    price: Optional[float] = None[m
[32m+[m
[32m+[m
[32m+[m[32mclass Sandwich(SandwichBase):[m
[32m+[m[32m    id: int[m
[32m+[m
[32m+[m[32m    class ConfigDict:[m
[32m+[m[32m        from_attributes = True[m
[32m+[m
[32m+[m
[32m+[m[32mclass ResourceBase(BaseModel):[m
[32m+[m[32m    item: str[m
[32m+[m[32m    amount: int[m
[32m+[m
[32m+[m
[32m+[m[32mclass ResourceCreate(ResourceBase):[m
[32m+[m[32m    pass[m
[32m+[m
[32m+[m
[32m+[m[32mclass ResourceUpdate(BaseModel):[m
[32m+[m[32m    item: Optional[str] = None[m
[32m+[m[32m    amount: Optional[int] = None[m
[32m+[m
[32m+[m
[32m+[m[32mclass Resource(ResourceBase):[m
[32m+[m[32m    id: int[m
[32m+[m
[32m+[m[32m    class ConfigDict:[m
[32m+[m[32m        from_attributes = True[m
[32m+[m
[32m+[m
[32m+[m[32mclass RecipeBase(BaseModel):[m
[32m+[m[32m    amount: int[m
[32m+[m
[32m+[m
[32m+[m[32mclass RecipeCreate(RecipeBase):[m
[32m+[m[32m    sandwich_id: int[m
[32m+[m[32m    resource_id: int[m
[32m+[m
[32m+[m[32mclass RecipeUpdate(BaseModel):[m
[32m+[m[32m    sandwich_id: Optional[int] = None[m
[32m+[m[32m    resource_id: Optional[int] = None[m
[32m+[m[32m    amount: Optional[int] = None[m
[32m+[m
[32m+[m[32mclass Recipe(RecipeBase):[m
[32m+[m[32m    id: int[m
[32m+[m[32m    sandwich: Sandwich = None[m
[32m+[m[32m    resource: Resource = None[m
[32m+[m
[32m+[m[32m    class ConfigDict:[m
[32m+[m[32m        from_attributes = True[m
[32m+[m
[32m+[m
[32m+[m[32mclass OrderDetailBase(BaseModel):[m
[32m+[m[32m    amount: int[m
[32m+[m
[32m+[m
[32m+[m[32mclass OrderDetailCreate(OrderDetailBase):[m
[32m+[m[32m    order_id: int[m
[32m+[m[32m    sandwich_id: int[m
[32m+[m
[32m+[m[32mclass OrderDetailUpdate(BaseModel):[m
[32m+[m[32m    order_id: Optional[int] = None[m
[32m+[m[32m    sandwich_id: Optional[int] = None[m
[32m+[m[32m    amount: Optional[int] = None[m
[32m+[m
[32m+[m
[32m+[m[32mclass OrderDetail(OrderDetailBase):[m
[32m+[m[32m    id: int[m
[32m+[m[32m    order_id: int[m
[32m+[m[32m    sandwich: Sandwich = None[m
[32m+[m
[32m+[m[32m    class ConfigDict:[m
[32m+[m[32m        from_attributes = True[m
[32m+[m
[32m+[m
[32m+[m[32mclass OrderBase(BaseModel):[m
[32m+[m[32m    customer_name: str[m
[32m+[m[32m    description: Optional[str] = None[m
[32m+[m
[32m+[m
[32m+[m[32mclass OrderCreate(OrderBase):[m
[32m+[m[32m    pass[m
[32m+[m
[32m+[m
[32m+[m[32mclass OrderUpdate(BaseModel):[m
[32m+[m[32m    customer_name: Optional[str] = None[m
[32m+[m[32m    description: Optional[str] = None[m
[32m+[m
[32m+[m
[32m+[m[32mclass Order(OrderBase):[m
[32m+[m[32m    id: int[m
[32m+[m[32m    order_date: Optional[datetime] = None[m
[32m+[m[32m    order_details: list[OrderDetail] = None[m
[32m+[m
[32m+[m[32m    class ConfigDict:[m
[32m+[m[32m        from_attributes = True[m
[1mdiff --git a/api/tests/__init__.py b/api/tests/__init__.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/api/tests/test_orders.py b/api/tests/test_orders.py[m
[1mnew file mode 100644[m
[1mindex 0000000..376ad0a[m
[1m--- /dev/null[m
[1m+++ b/api/tests/test_orders.py[m
[36m@@ -0,0 +1,31 @@[m
[32m+[m[32mfrom fastapi.testclient import TestClient[m
[32m+[m[32mfrom ..controllers import orders[m
[32m+[m[32mfrom ..main import app[m
[32m+[m[32mimport pytest[m
[32m+[m[32mfrom ..models import models[m
[32m+[m
[32m+[m[32m# Create a test client for the app[m
[32m+[m[32mclient = TestClient(app)[m
[32m+[m
[32m+[m
[32m+[m[32m@pytest.fixture[m
[32m+[m[32mdef db_session(mocker):[m
[32m+[m[32m    return mocker.Mock()[m
[32m+[m
[32m+[m
[32m+[m[32mdef test_create_order(db_session):[m
[32m+[m[32m    # Create a sample order[m
[32m+[m[32m    order_data = {[m
[32m+[m[32m        "customer_name": "John Doe",[m
[32m+[m[32m        "description": "Test order"[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    order_object = models.Order(**order_data)[m
[32m+[m
[32m+[m[32m    # Call the create function[m
[32m+[m[32m    created_order = orders.create(db_session, order_object)[m
[32m+[m
[32m+[m[32m    # Assertions[m
[32m+[m[32m    assert created_order is not None[m
[32m+[m[32m    assert created_order.customer_name == "John Doe"[m
[32m+[m[32m    assert created_order.description == "Test order"[m
[1mdiff --git a/requirements.txt b/requirements.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..ee3f99c[m
[1m--- /dev/null[m
[1m+++ b/requirements.txt[m
[36m@@ -0,0 +1,8 @@[m
[32m+[m[32mfastapi[m
[32m+[m[32muvicorn[m
[32m+[m[32msqlalchemy[m
[32m+[m[32mpymysql[m
[32m+[m[32mpytest[m
[32m+[m[32mpytest-mock[m
[32m+[m[32mhttpx[m
[32m+[m[32mcryptography[m
\ No newline at end of file[m
