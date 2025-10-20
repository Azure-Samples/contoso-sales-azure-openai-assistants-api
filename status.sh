#!/bin/bash

# Contoso Sales Assistant - Deployment Status and Information Script

echo "📊 Contoso Sales Assistant - Deployment Status"
echo "=============================================="
echo ""

# Check if azd environment exists
if ! azd env list | grep -q "ContosoSalesAssistant"; then
    echo "❌ No deployment found"
    echo "   Run './deploy-to-azure.sh' to deploy the application"
    exit 1
fi

# Get current deployment information
echo "📋 Current Deployment Information:"
echo ""

ENV_NAME=$(azd env get-value AZURE_ENV_NAME 2>/dev/null || echo "Not available")
LOCATION=$(azd env get-value AZURE_LOCATION 2>/dev/null || echo "Not available")
RESOURCE_GROUP=$(azd env get-value AZURE_OPENAI_RESOURCE_GROUP 2>/dev/null || echo "Not available")
SERVICE_URI=$(azd env get-value SERVICE_ACA_URI 2>/dev/null || echo "Not available")
ASSISTANT_PASSWORD=$(azd env get-value assistantPassword 2>/dev/null || echo "Not available")

echo "🏷️  Environment Name: $ENV_NAME"
echo "📍 Azure Region: $LOCATION"
echo "📦 Resource Group: $RESOURCE_GROUP"
echo ""

if [ "$SERVICE_URI" != "Not available" ]; then
    echo "✅ Application Status: DEPLOYED"
    echo ""
    echo "🌐 Application URL: ${SERVICE_URI}/sales"
    echo "👤 Username: sales@contoso.com"
    echo "🔑 Password: $ASSISTANT_PASSWORD"
    echo ""
    echo "🔗 Quick Access:"
    echo "   Application: ${SERVICE_URI}/sales"
    echo "   Azure Portal: https://portal.azure.com/#@/resource/subscriptions/$(azd env get-value AZURE_SUBSCRIPTION_ID 2>/dev/null)/resourceGroups/${RESOURCE_GROUP}/overview"
    echo ""
else
    echo "❌ Application Status: NOT DEPLOYED or FAILED"
    echo "   Run './deploy-to-azure.sh' to deploy the application"
    echo ""
fi

# Azure Resources Summary
echo "🏗️  Azure Resources:"
echo ""
OPENAI_RESOURCE=$(azd env get-value AZURE_OPENAI_RESOURCE 2>/dev/null || echo "Not available")
CONTAINER_APP=$(azd env get-value SERVICE_ACA_NAME 2>/dev/null || echo "Not available")
REGISTRY=$(azd env get-value AZURE_CONTAINER_REGISTRY_NAME 2>/dev/null || echo "Not available")

echo "   🤖 Azure OpenAI: $OPENAI_RESOURCE"
echo "   📱 Container App: $CONTAINER_APP"  
echo "   📦 Container Registry: $REGISTRY"
echo ""

# Useful commands
echo "🛠️  Useful Commands:"
echo ""
echo "   View logs:           azd logs"
echo "   Redeploy:            azd deploy"
echo "   Delete deployment:   azd down"
echo "   Environment status:  azd env show"
echo ""