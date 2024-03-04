// WARNING: Please don't edit this file. It was generated by C++/WinRT v2.0.220418.1

#pragma once
#ifndef WINRT_Windows_UI_Composition_Scenes_2_H
#define WINRT_Windows_UI_Composition_Scenes_2_H
#include "winrt/impl/Windows.Foundation.1.h"
#include "winrt/impl/Windows.Foundation.Collections.1.h"
#include "winrt/impl/Windows.UI.Composition.1.h"
#include "winrt/impl/Windows.UI.Composition.Scenes.1.h"
WINRT_EXPORT namespace winrt::Windows::UI::Composition::Scenes
{
    struct __declspec(empty_bases) SceneBoundingBox : winrt::Windows::UI::Composition::Scenes::ISceneBoundingBox,
        impl::base<SceneBoundingBox, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneBoundingBox, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneBoundingBox(std::nullptr_t) noexcept {}
        SceneBoundingBox(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneBoundingBox(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneComponent : winrt::Windows::UI::Composition::Scenes::ISceneComponent,
        impl::base<SceneComponent, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneComponent, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneComponent(std::nullptr_t) noexcept {}
        SceneComponent(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneComponent(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneComponentCollection : winrt::Windows::Foundation::Collections::IVector<winrt::Windows::UI::Composition::Scenes::SceneComponent>,
        impl::base<SceneComponentCollection, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneComponentCollection, winrt::Windows::UI::Composition::Scenes::ISceneComponentCollection, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneComponentCollection(std::nullptr_t) noexcept {}
        SceneComponentCollection(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::Collections::IVector<winrt::Windows::UI::Composition::Scenes::SceneComponent>(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneMaterial : winrt::Windows::UI::Composition::Scenes::ISceneMaterial,
        impl::base<SceneMaterial, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneMaterial, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneMaterial(std::nullptr_t) noexcept {}
        SceneMaterial(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneMaterial(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneMaterialInput : winrt::Windows::UI::Composition::Scenes::ISceneMaterialInput,
        impl::base<SceneMaterialInput, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneMaterialInput, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneMaterialInput(std::nullptr_t) noexcept {}
        SceneMaterialInput(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneMaterialInput(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneMesh : winrt::Windows::UI::Composition::Scenes::ISceneMesh,
        impl::base<SceneMesh, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneMesh, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneMesh(std::nullptr_t) noexcept {}
        SceneMesh(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneMesh(ptr, take_ownership_from_abi) {}
        static auto Create(winrt::Windows::UI::Composition::Compositor const& compositor);
    };
    struct __declspec(empty_bases) SceneMeshMaterialAttributeMap : winrt::Windows::UI::Composition::Scenes::ISceneMeshMaterialAttributeMap,
        impl::base<SceneMeshMaterialAttributeMap, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneMeshMaterialAttributeMap, winrt::Windows::Foundation::Collections::IIterable<winrt::Windows::Foundation::Collections::IKeyValuePair<hstring, winrt::Windows::UI::Composition::Scenes::SceneAttributeSemantic>>, winrt::Windows::Foundation::Collections::IMap<hstring, winrt::Windows::UI::Composition::Scenes::SceneAttributeSemantic>, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneMeshMaterialAttributeMap(std::nullptr_t) noexcept {}
        SceneMeshMaterialAttributeMap(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneMeshMaterialAttributeMap(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneMeshRendererComponent : winrt::Windows::UI::Composition::Scenes::ISceneMeshRendererComponent,
        impl::base<SceneMeshRendererComponent, winrt::Windows::UI::Composition::Scenes::SceneRendererComponent, winrt::Windows::UI::Composition::Scenes::SceneComponent, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneMeshRendererComponent, winrt::Windows::UI::Composition::Scenes::ISceneRendererComponent, winrt::Windows::UI::Composition::Scenes::ISceneComponent, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneMeshRendererComponent(std::nullptr_t) noexcept {}
        SceneMeshRendererComponent(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneMeshRendererComponent(ptr, take_ownership_from_abi) {}
        static auto Create(winrt::Windows::UI::Composition::Compositor const& compositor);
    };
    struct __declspec(empty_bases) SceneMetallicRoughnessMaterial : winrt::Windows::UI::Composition::Scenes::ISceneMetallicRoughnessMaterial,
        impl::base<SceneMetallicRoughnessMaterial, winrt::Windows::UI::Composition::Scenes::ScenePbrMaterial, winrt::Windows::UI::Composition::Scenes::SceneMaterial, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneMetallicRoughnessMaterial, winrt::Windows::UI::Composition::Scenes::IScenePbrMaterial, winrt::Windows::UI::Composition::Scenes::ISceneMaterial, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneMetallicRoughnessMaterial(std::nullptr_t) noexcept {}
        SceneMetallicRoughnessMaterial(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneMetallicRoughnessMaterial(ptr, take_ownership_from_abi) {}
        static auto Create(winrt::Windows::UI::Composition::Compositor const& compositor);
    };
    struct __declspec(empty_bases) SceneModelTransform : winrt::Windows::UI::Composition::Scenes::ISceneModelTransform,
        impl::base<SceneModelTransform, winrt::Windows::UI::Composition::CompositionTransform, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneModelTransform, winrt::Windows::UI::Composition::ICompositionTransform, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneModelTransform(std::nullptr_t) noexcept {}
        SceneModelTransform(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneModelTransform(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneNode : winrt::Windows::UI::Composition::Scenes::ISceneNode,
        impl::base<SceneNode, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneNode, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneNode(std::nullptr_t) noexcept {}
        SceneNode(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneNode(ptr, take_ownership_from_abi) {}
        static auto Create(winrt::Windows::UI::Composition::Compositor const& compositor);
    };
    struct __declspec(empty_bases) SceneNodeCollection : winrt::Windows::Foundation::Collections::IVector<winrt::Windows::UI::Composition::Scenes::SceneNode>,
        impl::base<SceneNodeCollection, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneNodeCollection, winrt::Windows::UI::Composition::Scenes::ISceneNodeCollection, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneNodeCollection(std::nullptr_t) noexcept {}
        SceneNodeCollection(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::Collections::IVector<winrt::Windows::UI::Composition::Scenes::SceneNode>(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneObject : winrt::Windows::UI::Composition::Scenes::ISceneObject,
        impl::base<SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneObject(std::nullptr_t) noexcept {}
        SceneObject(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneObject(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) ScenePbrMaterial : winrt::Windows::UI::Composition::Scenes::IScenePbrMaterial,
        impl::base<ScenePbrMaterial, winrt::Windows::UI::Composition::Scenes::SceneMaterial, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<ScenePbrMaterial, winrt::Windows::UI::Composition::Scenes::ISceneMaterial, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        ScenePbrMaterial(std::nullptr_t) noexcept {}
        ScenePbrMaterial(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::IScenePbrMaterial(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneRendererComponent : winrt::Windows::UI::Composition::Scenes::ISceneRendererComponent,
        impl::base<SceneRendererComponent, winrt::Windows::UI::Composition::Scenes::SceneComponent, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneRendererComponent, winrt::Windows::UI::Composition::Scenes::ISceneComponent, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneRendererComponent(std::nullptr_t) noexcept {}
        SceneRendererComponent(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneRendererComponent(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) SceneSurfaceMaterialInput : winrt::Windows::UI::Composition::Scenes::ISceneSurfaceMaterialInput,
        impl::base<SceneSurfaceMaterialInput, winrt::Windows::UI::Composition::Scenes::SceneMaterialInput, winrt::Windows::UI::Composition::Scenes::SceneObject, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneSurfaceMaterialInput, winrt::Windows::UI::Composition::Scenes::ISceneMaterialInput, winrt::Windows::UI::Composition::Scenes::ISceneObject, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneSurfaceMaterialInput(std::nullptr_t) noexcept {}
        SceneSurfaceMaterialInput(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneSurfaceMaterialInput(ptr, take_ownership_from_abi) {}
        static auto Create(winrt::Windows::UI::Composition::Compositor const& compositor);
    };
    struct __declspec(empty_bases) SceneVisual : winrt::Windows::UI::Composition::Scenes::ISceneVisual,
        impl::base<SceneVisual, winrt::Windows::UI::Composition::ContainerVisual, winrt::Windows::UI::Composition::Visual, winrt::Windows::UI::Composition::CompositionObject>,
        impl::require<SceneVisual, winrt::Windows::UI::Composition::IContainerVisual, winrt::Windows::UI::Composition::IVisual, winrt::Windows::UI::Composition::IVisual2, winrt::Windows::UI::Composition::IVisual3, winrt::Windows::UI::Composition::ICompositionObject, winrt::Windows::UI::Composition::ICompositionObject2, winrt::Windows::UI::Composition::ICompositionObject3, winrt::Windows::UI::Composition::ICompositionObject4, winrt::Windows::Foundation::IClosable, winrt::Windows::UI::Composition::IAnimationObject>
    {
        SceneVisual(std::nullptr_t) noexcept {}
        SceneVisual(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::UI::Composition::Scenes::ISceneVisual(ptr, take_ownership_from_abi) {}
        static auto Create(winrt::Windows::UI::Composition::Compositor const& compositor);
    };
}
#endif
