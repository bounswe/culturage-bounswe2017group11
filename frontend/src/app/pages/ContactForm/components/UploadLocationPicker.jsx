import React, { Component } from 'react';
import PlacesAutocomplete, { geocodeByAddress, getLatLng } from 'react-places-autocomplete'
 
export default class UploadLocationPicker extends Component {
    constructor(props) {
        super(props)
        this.state = { address: '' }
        this.onChange = (address) => {
            this.setState({ address })
            this.props.onChange(this.state.address);
        }
    }
    componentDidMount() {
        this.props.onRef(this)
    }
    componentWillUnmount() {
        this.props.onRef(undefined)
    }

    render() {
        const inputProps = {
            value: this.state.address,
            onChange: this.onChange,
            placeholder: 'Search Places...'
        }

        const cssClasses = {
            autocompleteContainer: 'my-autocomplete-container'
        }

        //const AutocompleteItem = ({ suggestion }) => (<div><i className="fa fa-map-marker"/>{suggestion}</div>)
        const AutocompleteItem = ({ formattedSuggestion }) => (
            <div className="Demo__suggestion-item">
                <i className='fa fa-map-marker Demo__suggestion-icon'/>
                <strong>{formattedSuggestion.mainText}</strong>{' '}
                <small className="text-muted">{formattedSuggestion.secondaryText}</small>
            </div>)

        return (
            <PlacesAutocomplete
                inputProps={inputProps}
                autocompleteItem={AutocompleteItem}
                classNames={cssClasses}
            />
        )
    }
}
