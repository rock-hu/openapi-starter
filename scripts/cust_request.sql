--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cust_request; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request (
    cust_request_id character varying(20) NOT NULL,
    cust_request_type_id character varying(20),
    cust_request_category_id character varying(20),
    status_id character varying(20),
    from_party_id character varying(20),
    priority numeric(20,0),
    cust_request_date timestamp with time zone,
    response_required_date timestamp with time zone,
    cust_request_name character varying(100),
    description character varying(255),
    maximum_amount_uom_id character varying(20),
    product_store_id character varying(20),
    sales_channel_enum_id character varying(20),
    fulfill_contact_mech_id character varying(20),
    currency_uom_id character varying(20),
    open_date_time timestamp with time zone,
    closed_date_time timestamp with time zone,
    internal_comment character varying(255),
    reason character varying(255),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request OWNER TO ofbiz;

--
-- Name: cust_request pk_cust_request; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT pk_cust_request PRIMARY KEY (cust_request_id);


--
-- Name: cst_rqst_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqst_txcrts ON cust_request USING btree (created_tx_stamp);


--
-- Name: cst_rqst_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqst_txstmp ON cust_request USING btree (last_updated_tx_stamp);


--
-- Name: cust_req_auom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_auom ON cust_request USING btree (maximum_amount_uom_id);


--
-- Name: cust_req_cat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_cat ON cust_request USING btree (cust_request_category_id);


--
-- Name: cust_req_channel; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_channel ON cust_request USING btree (sales_channel_enum_id);


--
-- Name: cust_req_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_cuom ON cust_request USING btree (currency_uom_id);


--
-- Name: cust_req_frmpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_frmpty ON cust_request USING btree (from_party_id);


--
-- Name: cust_req_fulcm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_fulcm ON cust_request USING btree (fulfill_contact_mech_id);


--
-- Name: cust_req_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_prds ON cust_request USING btree (product_store_id);


--
-- Name: cust_req_status; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_status ON cust_request USING btree (status_id);


--
-- Name: cust_req_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_type ON cust_request USING btree (cust_request_type_id);


--
-- Name: cust_request cust_req_auom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_auom FOREIGN KEY (maximum_amount_uom_id) REFERENCES uom(uom_id);


--
-- Name: cust_request cust_req_cat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_cat FOREIGN KEY (cust_request_category_id) REFERENCES cust_request_category(cust_request_category_id);


--
-- Name: cust_request cust_req_channel; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_channel FOREIGN KEY (sales_channel_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: cust_request cust_req_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: cust_request cust_req_frmpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_frmpty FOREIGN KEY (from_party_id) REFERENCES party(party_id);


--
-- Name: cust_request cust_req_fulcm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_fulcm FOREIGN KEY (fulfill_contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: cust_request cust_req_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: cust_request cust_req_status; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_status FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: cust_request cust_req_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request
    ADD CONSTRAINT cust_req_type FOREIGN KEY (cust_request_type_id) REFERENCES cust_request_type(cust_request_type_id);


--
-- PostgreSQL database dump complete
--

