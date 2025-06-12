#!/bin/bash

# Check if feature name is provided
if [ -z "$1" ]; then
    echo "Usage: ./create_feature.sh <feature_name>"
    echo "Example: ./create_feature.sh settings"
    exit 1
fi

# Convert feature name to snake_case if it isn't already
FEATURE_NAME=$(echo "$1" | sed -E 's/([a-z0-9])([A-Z])/\1_\2/g' | tr '[:upper:]' '[:lower:]')

# Base directory for the feature
FEATURE_DIR="lib/features/$FEATURE_NAME"

# Create main feature directory
mkdir -p "$FEATURE_DIR"

# Create subdirectories
mkdir -p "$FEATURE_DIR/data/datasources"
mkdir -p "$FEATURE_DIR/data/models"
mkdir -p "$FEATURE_DIR/data/repositories"
mkdir -p "$FEATURE_DIR/domain/entities"
mkdir -p "$FEATURE_DIR/domain/repositories"
mkdir -p "$FEATURE_DIR/domain/usecases"
mkdir -p "$FEATURE_DIR/presentation/pages"
mkdir -p "$FEATURE_DIR/presentation/providers"
mkdir -p "$FEATURE_DIR/presentation/widgets"

# Create basic files
# Data Layer
cat > "$FEATURE_DIR/data/datasources/${FEATURE_NAME}_remote_data_source.dart" << EOL
abstract class ${FEATURE_NAME^}RemoteDataSource {
  // Add remote data source methods here
}
EOL

cat > "$FEATURE_DIR/data/models/${FEATURE_NAME}_model.dart" << EOL
class ${FEATURE_NAME^}Model {
  // Add model properties and methods here
}
EOL

cat > "$FEATURE_DIR/data/repositories/${FEATURE_NAME}_repository_impl.dart" << EOL
import '../../domain/repositories/${FEATURE_NAME}_repository.dart';

class ${FEATURE_NAME^}RepositoryImpl implements ${FEATURE_NAME^}Repository {
  // Implement repository methods here
}
EOL

# Domain Layer
cat > "$FEATURE_DIR/domain/entities/${FEATURE_NAME}_entity.dart" << EOL
class ${FEATURE_NAME^}Entity {
  // Add entity properties here
}
EOL

cat > "$FEATURE_DIR/domain/repositories/${FEATURE_NAME}_repository.dart" << EOL
abstract class ${FEATURE_NAME^}Repository {
  // Add repository abstract methods here
}
EOL

cat > "$FEATURE_DIR/domain/usecases/get_${FEATURE_NAME}.dart" << EOL
class Get${FEATURE_NAME^} {
  // Add usecase implementation here
}
EOL

# Presentation Layer
cat > "$FEATURE_DIR/presentation/providers/${FEATURE_NAME}_provider.dart" << EOL
import 'package:flutter/foundation.dart';

class ${FEATURE_NAME^}Provider extends ChangeNotifier {
  // Add provider state and methods here
  
  // Example method:
  void someMethod() {
    // Update state
    notifyListeners();
  }
}
EOL

cat > "$FEATURE_DIR/presentation/pages/${FEATURE_NAME}_page.dart" << EOL
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/${FEATURE_NAME}_provider.dart';

class ${FEATURE_NAME^}Page extends StatelessWidget {
  const ${FEATURE_NAME^}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ${FEATURE_NAME^}Provider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('${FEATURE_NAME^}'),
        ),
        body: Consumer<${FEATURE_NAME^}Provider>(
          builder: (context, provider, child) {
            return const Center(
              child: Text('${FEATURE_NAME^} Page'),
            );
          },
        ),
      ),
    );
  }
}
EOL

cat > "$FEATURE_DIR/presentation/widgets/${FEATURE_NAME}_widget.dart" << EOL
import 'package:flutter/material.dart';

class ${FEATURE_NAME^}Widget extends StatelessWidget {
  const ${FEATURE_NAME^}Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add widget implementation here
    );
  }
}
EOL

echo "Feature '$FEATURE_NAME' created successfully!"
echo "Directory structure:"
tree "$FEATURE_DIR" 